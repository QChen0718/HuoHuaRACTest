//
//  UIViewController+HHHierarchy.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "UIViewController+HHHierarchy.h"

@implementation UIViewController (HHHierarchy)
//最上面的控制器
- (UIViewController *)hh_topMostController {
    
    UIViewController *topController = self ;
    while ([self presentedViewController])
        topController = [topController presentedViewController];
    return topController;
    
}
- (UIViewController *)hh_currentViewController {
    
    UIViewController *currentViewController = [self hh_topMostController];
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    return currentViewController;
    
}
/// 我们在非视图类中想要随时展示一个view时，需要将被展示的view加到当前view的子视图，
/// 或用当前view presentViewController，或pushViewContrller，这些操作都需要获取当前正在显示的ViewController。
/// 获取当前view的UIViewController
+ (UIViewController *)hh_currentViewControllerFromCurrentView{
    
    UIViewController *result = nil;
    // 1. get current window
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *tempWindow in windows) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }
    
    // 2. get current View Controller
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
    
}

/// 获取当前屏幕中present出来的viewcontroller。
+ (UIViewController *)hh_getPresentedViewController {
    
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
    
}
@end
