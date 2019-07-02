//
//  HHDevice.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#ifndef HHDevice_h
#define HHDevice_h
//获取`Version`对外显示版本号
#define HH_SHORT_VERSION                              [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//获取`Build`构建版本号
#define HH_BUILD_VERSION                              [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//获取`Device`版本号信息
#define HH_SYSTEM_VERSION                             [[UIDevice currentDevice] systemVersion]
//获取当前时间戳
#define HH_CURRENT_TIMESTAMP                          [NSString stringWithFormat:@"%ld", (long)([[NSDate date] timeIntervalSince1970] * 1000)]
///主屏幕
#define HH_MAIN_SCREEN                                [[UIScreen mainScreen] bounds]
///主屏幕的高度
#define HH_SCREEN_HEIGHT                              [[UIScreen mainScreen] bounds].size.height
///主屏幕的宽度
#define HH_SCREEN_WIDTH                               [[UIScreen mainScreen] bounds].size.width
///keyWindow
#define HH_KEYWINDOW                                  [UIApplication sharedApplication].keyWindow

//iPhoneX / iPhoneXS
#define  isIphoneX_XS     (HH_SCREEN_WIDTH == 375.f && HH_SCREEN_HEIGHT == 812.f ? YES : NO)
//iPhoneXR / iPhoneXSMax
#define  isIphoneXR_XSMax    (HH_SCREEN_WIDTH == 414.f && HH_SCREEN_HEIGHT == 896.f ? YES : NO)
//异性全面屏
#define   SZisFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)

// 状态栏高度
#define STATUS_BAR_HEIGHT (SZisFullScreen ? 44.f : 20.f)
// 异面屏状态栏多出高度
#define STATUS_HEIGHT_CHA (SZisFullScreen ? 24.f : 0.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (SZisFullScreen ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (SZisFullScreen ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (SZisFullScreen ? 34.f : 0.f)
// 底部按钮
#define BOTTOM_HEIGHT (SZisFullScreen ? 34.f : 20.f)
// 当前屏幕/375后的比例
#define KScreenRate (375 / HH_SCREEN_WIDTH)

#define KSuitFloat(float) (float / KScreenRate)
//按比例设置大小
#define KSuitSize(width, height) CGSizeMake(width / KScreenRate, height / KScreenRate)
//按比例设置位置
#define KSuitPoint(x, y) CGPointMake(x / KScreenRate, y / KScreenRate)
//按比例设置位置和大小
#define KSuitFrame(x, y, width, heigth) CGRectMake(x / KScreenRate, y / KScreenRate, width / KScreenRate, heigth / KScreenRate)
#endif /* HHDevice_h */
