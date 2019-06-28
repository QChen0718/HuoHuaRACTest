//
//  HHURLParameters.m
//  RACHHTest
//
//  Created by White-C on 2019/6/27.
//  Copyright © 2019 White-C. All rights reserved.
//  设置请求参数

#import "HHURLParameters.h"

@interface HHURLParameters ()
/// 是否加载loading
@property (nonatomic, readwrite, assign) BOOL loading;
/// 加载loading所在视图
@property (nonatomic, readwrite, strong) UIView *loadView;
/// 头部路径 （v14/order）
@property (nonatomic, readwrite, strong) NSString *headpath;
/// 路径 （v14/order）
@property (nonatomic, readwrite, strong) NSString *path;
/// 方法 （POST/GET）
@property (nonatomic, readwrite, strong) NSString *method;
/// 参数列表(body对应的参数)
@property (nonatomic, readwrite, strong) NSDictionary *parameters;
@end

@implementation HHURLParameters

+ (instancetype)hh_urlParametersWithMethod:(NSString *)method
                                  headpath:(nonnull NSString *)headpath
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
                                   loading:(BOOL)loading
{
    return [[self alloc]initUrlParametersWithMethod:method headpath:headpath path:path parameters:parameters loading:loading];
    
}
- (instancetype)initUrlParametersWithMethod:(NSString *)method
                                   headpath:(NSString *)headpath
                                       path:(NSString *)path
                                 parameters:(NSDictionary *)parameters
                                    loading:(BOOL)loading
{
    self = [super init];
    if (self) {
        self.loading=loading;
        self.method=method;
        self.headpath=headpath;
        self.path=path;
        self.parameters=parameters;
    }
    return self;
}

@end
