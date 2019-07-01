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
#define KCELLID @"kcellid"

@interface HHHomeView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,readwrite,strong)HHHomeViewModel *homeviewModel;
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
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@(self.pageNum) forKey:@"pageNum"];
    [dict setObject:@(self.pageSize) forKey:@"pageSize"];
    [self.homeviewModel.homelistCommand execute:dict];
    [self addSubview:self.tableview];
}
- (void)hh_bindViewModel
{
    //订阅
    [self.homeviewModel.homelistCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        
    }];
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:HH_MAIN_SCREEN style:UITableViewStyleGrouped];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        [_tableview registerNib:[UINib nibWithNibName:@"HHHomeTableViewCell" bundle:nil] forCellReuseIdentifier:KCELLID];
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
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCELLID forIndexPath:indexPath];
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
