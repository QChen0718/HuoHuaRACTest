//
//  UIViewController+HHHierarchy.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//  从UIViewController中获取当前控制器视图

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HHHierarchy)
- (UIViewController *)hh_topMostController ;

- (UIViewController *)hh_currentViewController;

/// 我们在非视图类中想要随时展示一个view时，需要将被展示的view加到当前view的子视图，
/// 或用当前view presentViewController，或pushViewContrller，这些操作都需要获取当前正在显示的ViewController。
/// 获取当前view的UIViewController
+ (UIViewController *)hh_currentViewControllerFromCurrentView;

/// 获取当前屏幕中present出来的viewcontroller。
+ (UIViewController *)hh_getPresentedViewController;
@end

NS_ASSUME_NONNULL_END
