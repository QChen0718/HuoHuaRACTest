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
    [self addSubview:self.tableview];
}
- (void)hh_bindViewModel
{
    //必须是先订阅在执行
    //订阅
    [self.homeviewModel.homelistCommand.executionSignals.switchToLatest subscribeNext:^(HHHomeModel *homemodel) {
        [self.sumModelArray addObjectsFromArray: homemodel.list];
        [self.tableview reloadData];
    }];
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
        _tableview.mj_header=[MJRefreshHeader headerWithRefreshingBlock:^{
           //刷新
            
        }];
        _tableview.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
           //加载
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
    cell.textLabel.text=listmodel.talkerName;
    return cell;
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
