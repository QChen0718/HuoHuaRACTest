//
//  HHHomeViewModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeViewModel.h"
#import "HHHomeModel.h"
@interface HHHomeViewModel ()
@property (nonatomic,readwrite,strong)RACCommand *homelistCommand;
@end

@implementation HHHomeViewModel


- (RACCommand *)homelistCommand
{
    if (!_homelistCommand) {
        _homelistCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
           //返回一个信号
            return [self requestHomeList:input];
        }];
    }
    return _homelistCommand;
}

- (RACSignal *)requestHomeList:(NSDictionary *)dict
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kAudioUnifiedUrl path:kAudioListUrl parameters:dict loading:YES];
        HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
        [[[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHHomeModel class]] subscribeNext:^(HHHomeModel *homemodel) {
            [subscriber sendNext:homemodel];
            [subscriber sendCompleted];
        }error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{}];
    }];
}

@end
