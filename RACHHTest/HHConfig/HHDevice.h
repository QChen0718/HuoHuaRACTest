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
#endif /* HHDevice_h */
