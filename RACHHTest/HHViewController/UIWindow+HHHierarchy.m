//
//  UIWindow+HHHierarchy.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "UIWindow+HHHierarchy.h"

@implementation UIWindow (HHHierarchy)
/// 方法一

- (UIViewController *)visibleViewController {
    UIViewController *rootViewController = [[[[UIApplication sharedApplication] delegate] window]rootViewController];
    return [UIWindow getVisibleViewControllerFrom:rootViewController];
}

// 类方法
+ (UIViewController *)getVisibleViewControllerFrom:(UIViewController *)vc{
    if ([vc isKindOfClass:[UINavigationController class]]) {
        //导航啦
        return [UIWindow getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        //标签栏
        return [UIWindow getVisibleViewControllerFrom:[((UITabBarController *)vc) selectedViewController]];
    }else {
        if (vc.presentedViewController) {
            //模态出去的控制器
            return [UIWindow getVisibleViewControllerFrom:vc.presentedViewController];
        }else{
            return vc;
        }
    }
}

/// 方法二

- (UIViewController *)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    //取出标签栏选择的控制器
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    }
    else if (rootViewController.presentedViewController)
    {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    }
    else {
        return rootViewController;
    }
}



@end
