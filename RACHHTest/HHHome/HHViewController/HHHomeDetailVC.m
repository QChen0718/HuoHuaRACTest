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
@property (nonatomic,strong,readwrite)RACSubject *updateListSubject;
@end

@implementation HHHomeDetailVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.homedetailView.willAppearSignal sendNext:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"音频详情";
    [self.view addSubview:self.homedetailView];

    [self.homedetailView.buybtnsubject subscribeNext:^(id  _Nullable x) {
        [self.updateListSubject sendNext:x];
    }];
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

- (RACSubject *)updateListSubject
{
    if (!_updateListSubject) {
        _updateListSubject = [RACSubject subject];
    }
    return _updateListSubject;
}
@end
