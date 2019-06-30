//
//  HHViewModelProtocol.h
//  RACHHTest
//
//  Created by White-C on 2019/6/30.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHHttpservice.h"
NS_ASSUME_NONNULL_BEGIN

@protocol HHViewModelProtocol <NSObject>

@optional

/**
 *  在使用以下几个初始化方法后会走此方法
 */
- (void)hh_initialize;

/**
 *  继承自HHBaseModel的model进行初始化
 */
- (instancetype)initWithModel:(id)model;

/**
 初始化一个HHBaseViewModel viewController当前控制器
 */
- (nonnull instancetype)initWithTarget:(UIViewController *_Nullable)viewController;

/**
 初始化一个HHBaseViewModel 及 参数传递
 */
- (instancetype)initWithTarget:(UIViewController *)viewController parameters:(NSDictionary *)param;
@end

NS_ASSUME_NONNULL_END
