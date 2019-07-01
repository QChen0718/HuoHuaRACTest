//
//  HHNavigationViewController.m
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHNavigationViewController.h"

@interface HHNavigationViewController ()

@end

@implementation HHNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
