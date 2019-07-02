//
//  HHHomeViewController.m
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeViewController.h"
#import "HHHomeView.h"
#import "HHHomeViewModel.h"
@interface HHHomeViewController ()
@property (nonatomic,strong)HHHomeView *homeview;
@property (nonatomic,strong)HHHomeViewModel *homeviewModel;
@end

@implementation HHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.homeview];
}

- (HHHomeViewModel *)homeviewModel
{
    if (!_homeviewModel) {
        _homeviewModel = [[HHHomeViewModel alloc]initWithTarget:self];
    }
    return _homeviewModel;
}

- (HHHomeView *)homeview
{
    if (!_homeview) {
        _homeview = [[HHHomeView alloc]initWithViewModel:self.homeviewModel];
    }
    return _homeview;
}

@end
