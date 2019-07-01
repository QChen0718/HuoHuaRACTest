//
//  HHLoginViewModel.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHLoginViewModel.h"
@interface HHLoginViewModel ()
@property (nonatomic,readwrite,strong)RACCommand *loginCommand;
@end


@implementation HHLoginViewModel
- (RACCommand *)loginCommand
{
    if (!_loginCommand) {
        _loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [self loginRequest];
        }];
    }
    return _loginCommand;
}

//登录接口调用
- (RACSignal *)loginRequest{
    NSString *promptStr = nil;
    if (self.phone == nil||self.phone.length==0) {
        promptStr = @"手机号不能为空";
    }
    else if (self.password == nil || self.password.length == 0)
    {
        promptStr = @"密码不能为空";
    }
    if (promptStr) {
        //返回一个空信号
        return [RACSignal empty];
    }
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSMutableDictionary *dict =[[NSMutableDictionary alloc]init];
        [dict setObject:self.phone forKey:@"phonenumber"];
        [dict setObject:self.password.SHA256  forKey:@"password"];
        HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kProtocolUrl_Pre path:kLogin parameters:dict loading:YES];
        HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
        [[[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHLoginModel class]] subscribeNext:^(HHLoginModel *userinfo) {
            [subscriber sendNext:userinfo];
            [subscriber sendCompleted];
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
}

@end
