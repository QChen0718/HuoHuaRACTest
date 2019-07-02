//
//  MBProgressHUD+Category.m
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "MBProgressHUD+Category.h"

@implementation MBProgressHUD (Category)
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) {
        //添加到window上面
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    CGRect frame = hud.frame;
    //
    if (CGRectEqualToRect(frame, HH_MAIN_SCREEN)) {
        frame = CGRectMake(0.f, NAVIGATION_BAR_HEIGHT, HH_SCREEN_WIDTH, HH_SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT);
    }
    hud.frame=frame;
    //指示器提示的文字
    hud.label.text=text;
    hud.label.font=[UIFont systemFontOfSize:16.f];
    //内容颜色
    hud.contentColor = [UIColor whiteColor];
    //黑色百分之九十的透明度
    hud.bezelView.backgroundColor=[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9];
    //设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    //设置模式 Shows a custom view 显示自定义view
    hud.mode = MBProgressHUDModeCustomView;
    //隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //设置消失时间
    [hud hideAnimated:YES afterDelay:1.5f];
}
/**
 *  显示成功信息
 *
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}
/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"" view:view];
}
/**
 *  显示错误信息
 *
 *  @param error 信息内容
 */
+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}
/**
 *  显示错误信息
 *
 *  @param error 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view
{
    [self show:error icon:@"" view:view];
}

/**
 显示一些信息

 @param message 信息内容
 @param view 需要显示信息的视图
 @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    CGRect frame = hud.frame;
    if (CGRectEqualToRect(frame, HH_MAIN_SCREEN) && view != HH_KEYWINDOW) {
        //不是显示在window上且frame是当前UIScreen.bounds
        frame = CGRectMake(0.f, NAVIGATION_BAR_HEIGHT, HH_SCREEN_WIDTH, HH_SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT);
    }
    hud.frame = frame;
    hud.label.text = message;
    hud.label.font = [UIFont systemFontOfSize:16.f];
    hud.contentColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9];
    // 隐藏的时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    //
    return hud;
}

/**
 显示错误信息

 @param message 信息内容
 @return 直接返回一个MBProgressHUD
 */
+ (MBProgressHUD *)showMessage:(NSString *)message
{
   return  [self showMessage:message toView:nil];
}
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
+ (void)hideHUDForView:(UIView *)view
{
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
}
@end
