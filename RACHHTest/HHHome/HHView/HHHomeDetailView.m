//
//  HHHomeDetailView.m
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailView.h"
#import "HHHomeDetailHeaerView.h"
#import "HHHomeDetailViewModel.h"
#import "HHHomeDetailModel.h"
#define CELLID @"cellid"
@interface HHHomeDetailView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)HHHomeDetailViewModel *detailviewModel;
@property (nonatomic,strong)HHHomeDetailModel *detailModel;
@end


@implementation HHHomeDetailView

- (void)hh_setupViews
{
    [self addSubview:self.tableview];
}
- (void)hh_bindViewModel
{
    [self.detailviewModel.requestDetailCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
       //获得最新的信号
        self.detailModel=(HHHomeDetailModel *)x;
        //更新UI数据
        
    }];
}

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel
{
    self.detailviewModel=(HHHomeDetailViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:HH_MAIN_SCREEN style:UITableViewStyleGrouped];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
    }
    return _tableview;
}
#pragma tableview的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    return cell;
}
@end
