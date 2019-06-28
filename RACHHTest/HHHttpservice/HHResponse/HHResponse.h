//
//  HHResponse.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"
#import "HHHTTPServiceConstant.h"
NS_ASSUME_NONNULL_BEGIN

@interface HHResponse : HHBaseModel
/// 响应代码 `0000`表示交易成功
@property (nonatomic, readwrite, copy) NSString *responseCode;
/// 响应消息
@property (nonatomic, readwrite, copy) NSString *responseMsg;
/// 自己服务器返回的信息 请求体的内容
@property (nonatomic, readwrite, strong) NSDictionary *body;
@end

NS_ASSUME_NONNULL_END
