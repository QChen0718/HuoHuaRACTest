//
//  HHLoginViewController.m
//  RACHHTest
//
//  Created by White-C on 2019/6/30.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHLoginViewController.h"
#import "HHLoginView.h"
#import "HHLoginViewModel.h"
@interface HHLoginViewController ()
@property (nonatomic,strong)HHLoginView *loginview;
@property (nonatomic,strong)HHLoginViewModel *loginviewModel;
@end

@implementation HHLoginViewController


- (HHLoginViewModel *)loginviewModel
{
    if (!_loginviewModel) {
        _loginviewModel = [[HHLoginViewModel alloc]initWithTarget:self];
    }
    return _loginviewModel;
}

- (HHLoginView *)loginview
{
    if (!_loginview) {
        _loginview = [[HHLoginView alloc]initWithViewModel:self.loginviewModel];
    }
    return _loginview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"登录";
    [self.view addSubview:self.loginview];
}




@end
