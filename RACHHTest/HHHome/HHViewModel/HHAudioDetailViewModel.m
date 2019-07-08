//
//  HHAudioDetailViewModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/8.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHAudioDetailViewModel.h"

@interface HHAudioDetailViewModel ()
@property (nonatomic,readwrite,strong)RACCommand *circlrDetailCommand;
@end

@implementation HHAudioDetailViewModel
- (RACCommand *)circlrDetailCommand
{
    if (!_circlrDetailCommand) {
        _circlrDetailCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            HHURLParameters *parameters = [HHURLParameters hh_urlParametersWithMethod:HHHTTPRequestMethodPost headpath:kProtocolUrl_Pre path:@"" parameters:@{} loading:YES];
            HHHTTPRequest *request = [HHHTTPRequest hh_requestWithParameters:parameters];
           return [[HHHttpservice sharedInstance]hh_enqueueRequest:request resultClass:nil];
        }];
    }
    return _circlrDetailCommand;
}
@end
