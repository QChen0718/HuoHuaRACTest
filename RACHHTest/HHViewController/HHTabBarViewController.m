//
//  HHTabBarViewController.m
//  RACHHTest
//
//  Created by White-C on 2019/7/5.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHTabBarViewController.h"
#import "HHNavigationViewController.h"
#import "HHHomeViewController.h"
#import "HHAudioViewController.h"
@interface HHTabBarViewController ()

@end

@implementation HHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewControllerClick];
    
}
- (void)addChildViewControllerClick
{
    HHAudioViewController *homevc=[[HHAudioViewController alloc]init];
    [self setupChildVc:homevc title:@"" image:@"buttn_shi_normal" selectedImage:@"buttn_shi_hover" withItemTag:1];
    HHHomeViewController *audiovc = [[HHHomeViewController alloc]init];
    [self setupChildVc:audiovc title:@"" image:@"buttn_she_normal" selectedImage:@"buttn_she_hover" withItemTag:2];
    
    UIViewController *criclevc=[[UIViewController alloc]init];
    [self setupChildVc:criclevc title:@"" image:@"tab_dongtai_normal" selectedImage:@"tab_dongtai_select" withItemTag:3];
    UIViewController *mevc=[[UIViewController alloc]init];
    [self setupChildVc:mevc title:@"" image:@"buttn_wu_normal" selectedImage:@"buttn_wu_hover" withItemTag:4];
}
/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage withItemTag:(NSInteger)tag
{
    // 设置图片
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [vc.tabBarItem setImageInsets:UIEdgeInsetsMake(7, 0, -7, 0)];
    vc.tabBarItem.title=title;
    vc.tabBarItem.tag = 666 + tag;
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    HHNavigationViewController *nav = [[HHNavigationViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
