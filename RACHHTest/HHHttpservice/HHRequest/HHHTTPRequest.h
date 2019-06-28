//
//  HHHTTPRequest.h
//  RACHHTest
//
//  Created by White-C on 2019/6/27.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHURLParameters.h"
NS_ASSUME_NONNULL_BEGIN

@interface HHHTTPRequest : NSObject
/// 请求参数
@property (nonatomic, readonly, strong) HHURLParameters *urlParameters;
/**
 *  获取请求类
 *
 *  @param parameters  参数模型
 *  @return 请求类
 */
+ (instancetype)hh_requestWithParameters:(HHURLParameters *)parameters;
@end

NS_ASSUME_NONNULL_END
