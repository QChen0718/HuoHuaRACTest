//
//  HHHTTPRequest.m
//  RACHHTest
//
//  Created by White-C on 2019/6/27.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHTTPRequest.h"
#import "HHHttpservice.h"

@interface HHHTTPRequest ()
@property (nonatomic, readwrite,strong)HHURLParameters *urlParameters;
@end

@implementation HHHTTPRequest
+ (instancetype)hh_requestWithParameters:(HHURLParameters *)parameters{
    return [[self alloc] initRequestWithParameters:parameters];
}

- (instancetype)initRequestWithParameters:(HHURLParameters *)parameters{
    
    self = [super init];
    if (self) {
        self.urlParameters = parameters;
    }
    return self;
}

@end
