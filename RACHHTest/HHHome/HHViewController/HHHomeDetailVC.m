//
//  HHHomeDetailVC.m
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailVC.h"
#import "HHHomeDetailView.h"
#import "HHHomeDetailViewModel.h"
@interface HHHomeDetailVC ()
@property (nonatomic,strong)HHHomeDetailView *homedetailView;
@property (nonatomic,strong)HHHomeDetailViewModel *homedetailViewModel;
@end

@implementation HHHomeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"音频详情";
    [self.view addSubview:self.homedetailView];
}
- (HHHomeDetailViewModel *)homedetailViewModel
{
    if (!_homedetailViewModel) {
        _homedetailViewModel = [[HHHomeDetailViewModel alloc]initWithTarget:self];
    }
    return _homedetailViewModel;
}

- (HHHomeDetailView *)homedetailView
{
    if (!_homedetailView) {
        _homedetailView = [[HHHomeDetailView alloc]initWithViewModel:self.homedetailViewModel parameters:@{@"id":@(self.audioid)}];
    }
    return _homedetailView;
}
@end
