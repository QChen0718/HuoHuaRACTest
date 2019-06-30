//
//  HHHttpservice.m
//  RACHHTest
//
//  Created by White-C on 2019/6/27.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHttpservice.h"

static HHHttpservice * _service = nil;

@implementation HHHttpservice
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _service = [[self alloc]init];
        /// 设置允许接收请求返回的数据格式类型
        _service.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                              @"text/plain",
                                                              @"text/html",
                                                              @"application/json",
                                                              @"text/json",
                                                              @"text/javascript", nil];
        /// 是否允许无效证书（也就是自建的证书），默认为NO 如果是需要验证自建证书，需要设置为YES
        _service.securityPolicy.allowInvalidCertificates   = NO;
        /// 请求序列化器
        _service.requestSerializer                         = [AFJSONRequestSerializer serializer];
        /// 超时时间
        _service.requestSerializer.timeoutInterval         = 40;
    });
    return _service;
}
/// 防止抓包
- (instancetype)initWithServerBaseURL:(NSURL *)baseURL {
    
    /// TODO: 当上线或渗透测试时打开2关闭1（防止抓包）
    
    //    // 1. debug 版本的包仍然能够正常抓包
    //    self = [super initWithBaseURL:baseURL];
    
    // 2. 由于使用 ephemeralSessionConfiguration session 发起的请求不带 cookie 和使用缓存等
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    conf.connectionProxyDictionary = @{};
    self = [super initWithBaseURL:baseURL sessionConfiguration:conf];
    
    /*
     #ifdef SIT_EVN_ON
     // debug 版本的包仍然能够正常抓包
     self = [super initWithBaseURL:baseURL];
     #elif UAT_EVN_ON
     // debug 版本的包仍然能够正常抓包
     self = [super initWithBaseURL:baseURL];
     #elif PRD_EVN_ON
     // 由于使用 ephemeralSessionConfiguration session 发起的请求不带 cookie 和使用缓存等
     NSURLSessionConfiguration *conf = [NSURLSessionConfiguration ephemeralSessionConfiguration];
     conf.connectionProxyDictionary = @{};
     self = [super initWithBaseURL:baseURL sessionConfiguration:conf];
     #endif
     */
    return self;
}
#pragma mark --- 检测网络连接状态
+ (void)hh_serviceConnectionAvailable {
    __block BOOL launchFirst = YES;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status != AFNetworkReachabilityStatusNotReachable) {
            //第一次不执行
            if (!launchFirst) {
                
            }
        }else {
            //无网络
        }
        launchFirst = NO;
    }];
}

//  发起请求
- (RACSignal *)hh_enqueueRequest:(HHHTTPRequest *)request resultClass:(Class)resultClass
{
    // reduceEach 对返回的元祖进行解包 取出里面的对象分别解析
    return [[[self hh_request:request] reduceEach:^RACStream *(NSURLResponse *response, NSDictionary *responseObject){
        return [self parsedResponseOfClass:resultClass responseObject:responseObject];
    }] concat];
}
//请求网络数据方法
- (RACSignal *)hh_request:(HHHTTPRequest *)request {
    @weakify(self);
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        NSError *serialiaztionError = nil;
        NSString *method = request.urlParameters.method;
        NSString *path = request.urlParameters.path;
        //设置baseURL
        _service = [self initWithServerBaseURL:[NSURL URLWithString:request.urlParameters.headpath]];
        NSDictionary *parameters =request.urlParameters.parameters ? [request.urlParameters.parameters mutableCopy] : [NSMutableDictionary dictionary];
        NSMutableURLRequest *urlRequest = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:path relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serialiaztionError];
        if (serialiaztionError) {
            //请求失败
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                //发送错误信号
                [subscriber sendError:serialiaztionError];
                [subscriber sendCompleted];
            });
#pragma clang diagnostic pop
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }
        //__block 修饰之后可以在block方法体里面对该属性进行修改
        __block BOOL loading = request.urlParameters.loading;
        /// 当前视图控制器
        __block UIViewController *controller = [HH_KEYWINDOW visibleViewController];
        ///确保当前视图控制器只有一个loading在加载
        [[MBProgressHUD HUDForView:controller.view] hideAnimated:YES];
        /// 加载loading
        if (loading) {
            [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
        }
        /// 获取请求任务
        __block NSURLSessionDataTask *task = nil;
        task = [self dataTaskWithRequest:urlRequest uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
            // 上传进度
        } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
            // 下载的进度
        } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (loading) {
                [MBProgressHUD hideHUDForView:controller.view animated:YES];
            }
            if (error) {
                //解析error提示错误信息
                [subscriber sendError:error];
                [subscriber sendCompleted];
            } else {
                /// 打包成元祖回调数据
                [subscriber sendNext:RACTuplePack(response, responseObject)];
                //发送结束
                [subscriber sendCompleted];
            }
            
        }];
        /// 开始请求任务
        [task resume];
        return [RACDisposable disposableWithBlock:^{
            /// 取消订阅，请求任务结束
            if (task.state != NSURLSessionTaskStateCompleted) {
                // 取消请求
                [task cancel];
            }
        }];
    }];
    //方法只执行一次可以被多次订阅并能获得值
    /// replayLazily返回一个冷的信号，会提供所有的值给订阅者。
    return [signal replayLazily];
}

#pragma mark --- 解析请求返回的数据

- (RACSignal *)parsedResponseOfClass:(Class)resultClass responseObject:(id)responseObject
{
    /// resultClass必须是HHBaseModel的子类 且 responseObject最外层必须是字典
    NSParameterAssert(resultClass == nil && [resultClass isKindOfClass:[HHBaseModel class]]);
    __block Class _resultClass = resultClass;
    __block id _responseObject = responseObject;
    /// 解析
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        if ([_responseObject isKindOfClass:[NSDictionary class]]) {
            /// 返回值模型化
            HHResponse *responseModel = [HHResponse hh_modelWithDictionary:_responseObject];
            if ([responseModel.responseCode isEqualToString:HHHTTPResponseCodeSuccess]) {
                if (_resultClass == nil) {
                    [subscriber sendNext:responseModel];
                    [subscriber sendCompleted];
                    return [RACDisposable disposableWithBlock:^{}];
                }
                ///有传模型进来
                id parsedObject = [_resultClass hh_modelWithDictionary:_responseObject];
                /// 确保解析出来是HHBaseModel的子类
                NSAssert([parsedObject isKindOfClass:HHBaseModel.class], @"Parsed model object is not an BaseModel: %@", parsedObject);
                [subscriber sendNext:parsedObject];
                [subscriber sendCompleted];
            }
            else {
                /// 请求返回的结果不是成功的
                [subscriber sendNext:responseModel.responseMsg];
                [subscriber sendCompleted];
            }
        }
        else if ([_responseObject isKindOfClass:[NSData class]])
        {
            /// 返回的是二进制数据
            NSString *resultStr = [NSString utf8String:_responseObject];
            [subscriber sendNext:resultStr];
            [subscriber sendCompleted];
        }
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

@end
