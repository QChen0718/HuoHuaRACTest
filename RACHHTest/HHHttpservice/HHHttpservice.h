//
//  HHHttpservice.h
//  RACHHTest
//
//  Created by White-C on 2019/6/27.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "HHHTTPRequest.h"
#import "HHResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHHttpservice : AFHTTPSessionManager

/// 单例
+ (instancetype)sharedInstance;

/*!
 * @brief 发起请求
 *
 * @param request       http请求类，不能为空
 * @param resultClass   请求返回值要解析成的模型的类（必须为HXBaseModel的子类，如果传入nil，则返回的值为HXHTTPResponse）
 * @return signal
 */
- (RACSignal *)hh_enqueueRequest:(HHHTTPRequest *)request
                     resultClass:(Class /*subclass of HXBaseModel*/)resultClass;
@end

NS_ASSUME_NONNULL_END
