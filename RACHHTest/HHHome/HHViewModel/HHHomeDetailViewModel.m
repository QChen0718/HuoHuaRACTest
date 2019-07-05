//
//  HHHomeDetailViewModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailViewModel.h"
#import "HHHomeListModel.h"
#import "HHHomeDetailModel.h"
#import "HHHomeDetailAudioListModel.h"
@interface HHHomeDetailViewModel ()
@property (nonatomic,readwrite,strong)RACCommand *requestDetailCommand;
@property (nonatomic,readwrite,strong)RACCommand *requestApartmentAudioCommand;
@end

@implementation HHHomeDetailViewModel
- (RACCommand *)requestDetailCommand
{
    if (!_requestDetailCommand) {
        @weakify(self)
        _requestDetailCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            //返回一个信号
            @strongify(self)
            return [self requestDetailData:input];
        }];
    }
    return _requestDetailCommand;
}

- (RACSignal *)requestDetailData:(NSDictionary *)dict
{
    
    if (dict==nil||dict.count==0) {
        return [RACSignal empty];
    }
    
    //开始请求数据
    HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kAudioUnifiedUrl path:kAudioSingleUrl parameters:dict loading:NO];
    HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
    return [[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHHomeDetailModel class]];
}

- (RACCommand *)requestApartmentAudioCommand
{
    if (!_requestApartmentAudioCommand) {
        _requestApartmentAudioCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [self requestAudioListData:input];
        }];
    }
    return _requestApartmentAudioCommand;
}

- (RACSignal *)requestAudioListData:(NSDictionary *)dict
{
    
        //请求列表数据
        HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kAudioUnifiedUrl path:kAudioItemUrl parameters:dict loading:YES];
        HHHTTPRequest *request =[HHHTTPRequest hh_requestWithParameters:parameters];
       return [[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHHomeDetailAudioListModel class]];
    
}

@end
