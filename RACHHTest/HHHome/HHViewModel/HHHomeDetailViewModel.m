//
//  HHHomeDetailViewModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailViewModel.h"
#import "HHHomeDetailModel.h"
@interface HHHomeDetailViewModel ()
@property (nonatomic,readwrite,strong)RACCommand *requestDetailCommand;
@end

@implementation HHHomeDetailViewModel
- (RACCommand *)requestDetailCommand
{
    if (!_requestDetailCommand) {
        _requestDetailCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            //返回一个信号
            return [self requestDetailData:input];
        }];
    }
    return _requestDetailCommand;
}

- (RACSignal *)requestDetailData:(NSDictionary *)dict
{
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       
        //开始请求数据
        HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kAudioUnifiedUrl path:kAudioSingleUrl parameters:dict loading:YES];
        HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
        [[[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHHomeDetailModel class]] subscribeNext:^(HHHomeDetailModel *model) {
            [subscriber sendNext:model];
            [subscriber sendCompleted];
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

@end
