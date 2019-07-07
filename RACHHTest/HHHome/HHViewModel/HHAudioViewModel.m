//
//  HHAudioViewModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/5.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHAudioViewModel.h"
#import "HHAudioModel.h"
#import "HHBannerModel.h"
#import "HHHomeModel.h"
@interface HHAudioViewModel ()
@property (nonatomic,readwrite,strong)RACCommand *homelistCommand;
//加载轮播图
@property (nonatomic,readwrite,strong)RACCommand *homeBannerCommand;
//推荐音频列表
@property (nonatomic,readwrite,strong)RACCommand *homeAudiolistcommand;
@end

@implementation HHAudioViewModel
- (RACCommand *)homelistCommand
{
    if (!_homelistCommand) {
        _homelistCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kProtocolUrl_Pre path:kHomeRecommendPost parameters:input loading:YES];
            HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
            return [[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHAudioModel class]];
        }];
    }
    return _homelistCommand;
}

- (RACCommand *)homeBannerCommand
{
    if (!_homeBannerCommand) {
        _homeBannerCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kProtocolUrl_Pre path:kHomeBannerUrl parameters:nil loading:NO];
            HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
           return [[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHBannerModel class]];
        }];
    }
    return _homeBannerCommand;
}

- (RACCommand *)homeAudiolistcommand
{
    if (!_homeAudiolistcommand) {
        _homeAudiolistcommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kAudioUnifiedUrl path:kAudioListUrl parameters:nil loading:NO];
            HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
           return [[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:[HHHomeModel class]];
        }];
    }
    return _homeAudiolistcommand;
}
@end
