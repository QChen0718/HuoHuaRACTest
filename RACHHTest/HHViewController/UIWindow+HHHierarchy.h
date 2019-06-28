//
//  UIWindow+HHHierarchy.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//  从UIWindow中获取当前控制器视图

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (HHHierarchy)
//获取当前控制器方法
- (UIViewController *)visibleViewController;
@end

NS_ASSUME_NONNULL_END
