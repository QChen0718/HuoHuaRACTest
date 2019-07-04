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
#import "HHHomeListModel.h"
#import "HHHomeDetailTableViewCell.h"
#define CELLID @"cellid"
@interface HHHomeDetailView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)HHHomeDetailViewModel *detailviewModel;
@property (nonatomic,strong)HHHomeListModel *listModel;
@property (nonatomic,strong)HHHomeDetailHeaerView *detailHeaderView;
@property (nonatomic,strong)HHHomeDetailModel *detailModel;
@property (nonatomic,strong)NSDictionary *parmdict;
@end


@implementation HHHomeDetailView

- (void)hh_setupViews
{
    //设置view大小
    self.frame=HH_MAIN_SCREEN;
    [self addSubview:self.tableview];
}
- (void)hh_bindViewModel
{
    [self.detailviewModel.requestDetailCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
       //获得最新的信号
        self.detailModel=(HHHomeDetailModel *)x;
        //更新UI数据
        self.listModel=self.detailModel.list;
        [self.detailHeaderView setDataModel:self.listModel];
    }];
    
    [self.detailviewModel.requestDetailCommand execute:self.parmdict];
}

- (HHHomeDetailHeaerView *)detailHeaderView
{
    if (!_detailHeaderView) {
        _detailHeaderView = [[HHHomeDetailHeaerView alloc]init];
        _detailHeaderView.backgroundColor=[UIColor redColor];
    }
    return _detailHeaderView;
}


- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel parameters:(nonnull NSDictionary *)param
{
    self.detailviewModel=(HHHomeDetailViewModel *)viewModel;
    self.parmdict=param;
    return [super initWithViewModel:viewModel parameters:param];
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:HH_MAIN_SCREEN style:UITableViewStyleGrouped];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        [_tableview registerNib:[UINib nibWithNibName:@"HHHomeDetailTableViewCell" bundle:nil] forCellReuseIdentifier:CELLID];
        _tableview.tableHeaderView = self.detailHeaderView;
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
    HHHomeDetailTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    return cell;
}
@end
