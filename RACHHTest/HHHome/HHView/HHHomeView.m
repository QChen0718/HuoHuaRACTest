//
//  HHHomeView.m
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeView.h"
#import "HHHomeViewModel.h"
#import "HHHomeTableViewCell.h"
#import "HHHomeModel.h"
#import "HHHomeListModel.h"
#import "HHHomeDetailVC.h"
#define KCELLID @"kcellid"

@interface HHHomeView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,readwrite,strong)HHHomeViewModel *homeviewModel;
@property (nonatomic,strong)NSMutableArray *sumModelArray;
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,assign)NSInteger pageNum;
@property (nonatomic,assign)NSInteger pageSize;
@end

@implementation HHHomeView
- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel
{
    self.homeviewModel=(HHHomeViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

- (void)hh_setupViews
{
    self.pageNum=0;
    self.pageSize=10;
    self.sumModelArray = [[NSMutableArray alloc]init];
    self.frame=HH_MAIN_SCREEN;
    [self addSubview:self.tableview];
}
- (void)hh_bindViewModel
{
    //必须是先订阅在执行
    //订阅
    [self.homeviewModel.homelistCommand.executionSignals.switchToLatest subscribeNext:^(HHHomeModel *homemodel) {
        if (self.pageNum==0) {
            [self.sumModelArray removeAllObjects];
        }
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
        [self.sumModelArray addObjectsFromArray: homemodel.list];
        [self.tableview reloadData];
    }];
    [self loadData];
}
//加载首页列表数据
- (void)loadData
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@(self.pageNum) forKey:@"pageNum"];
    [dict setObject:@(self.pageSize) forKey:@"pageSize"];
    //执行
    [self.homeviewModel.homelistCommand execute:dict];
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:HH_MAIN_SCREEN style:UITableViewStyleGrouped];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        [_tableview registerNib:[UINib nibWithNibName:@"HHHomeTableViewCell" bundle:nil] forCellReuseIdentifier:KCELLID];
        _tableview.rowHeight= UITableViewAutomaticDimension;
        _tableview.estimatedRowHeight=44;
        
        @weakify(self);
        _tableview.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
           //刷新
            @strongify(self);
            self.pageNum=0;
            [self loadData];
        }];
        _tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           //加载
            self.pageNum++;
            [self loadData];
        }];
    }
    return _tableview;
}


#pragma mark - tableview的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sumModelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCELLID forIndexPath:indexPath];
    HHHomeListModel *listmodel = self.sumModelArray[indexPath.row];
    [cell setDataModel:listmodel];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHHomeListModel *model = self.sumModelArray[indexPath.row];
    HHHomeDetailVC *vc = [[HHHomeDetailVC alloc]init];
    vc.audioid=model.audiodetail_id;
    [self.hh_viewController.navigationController pushViewController:vc animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
@end
