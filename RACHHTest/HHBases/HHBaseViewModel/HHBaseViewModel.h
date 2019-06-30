//
//  HHBaseViewModel.h
//  RACHHTest
//
//  Created by White-C on 2019/6/30.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHViewModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface HHBaseViewModel : NSObject <HHViewModelProtocol>
/// 当前控制器 readonly 只能读不能写
@property (nonatomic, weak, readonly) UIViewController *viewController;
/// 传递的参数
@property (nonatomic, strong, readonly) NSDictionary *parameters;
/// 是否取消掉左滑pop到上一层的功能（栈底控制器无效），默认为NO，不取消
@property (nonatomic, readwrite, assign) BOOL interactivePopDisabled;

/// 是否隐藏该控制器的导航栏 默认是不隐藏 (NO)
@property (nonatomic, readwrite, assign) BOOL prefersNavigationBarHidden;

/// 是否隐藏该控制器的导航栏底部的分割线 默认不隐藏 （NO）
@property (nonatomic, readwrite, assign) BOOL prefersNavigationBarBottomLineHidden;

/// 是否让IQKeyboardManager的管理键盘的事件 默认是YES（键盘管理）
@property (nonatomic, readwrite, assign) BOOL keyboardEnable;

/// 是否键盘弹起的时候，点击其他局域键盘弹起 默认是 YES
@property (nonatomic, readwrite, assign) BOOL shouldResignOnTouchOutside;
/// The `View` willAppearSignal
@property (nonatomic, readwrite, strong) RACSubject *willAppearSignal;
/// The `View` didAppearSignal
@property (nonatomic, readwrite, strong) RACSubject *didAppearSignal;
/// The `View` willDisappearSignal
@property (nonatomic, readwrite, strong) RACSubject *willDisappearSignal;
/// The `View` viewDidDisappearSignal
@property (nonatomic, readwrite, strong) RACSubject *didDisappearSignal;
@end

NS_ASSUME_NONNULL_END
