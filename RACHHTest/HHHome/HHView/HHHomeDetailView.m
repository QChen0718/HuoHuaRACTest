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
#import "HHHomeDetailAudioListModel.h"
#define CELLID @"cellid"
@interface HHHomeDetailView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)HHHomeDetailViewModel *detailviewModel;
//音频专辑列表模型
@property (nonatomic,strong)HHHomeListModel *listModel;
//详情列表头部视图
@property (nonatomic,strong)HHHomeDetailHeaerView *detailHeaderView;
//音频专辑详情模型
@property (nonatomic,strong)HHHomeDetailModel *detailModel;
//音频详情音频条目模型数据
@property (nonatomic,strong)NSMutableArray *sumdetailModel;
@property (nonatomic,strong)NSDictionary *parmdict;
@property (nonatomic,assign)NSInteger pageSize;
@property (nonatomic,assign)NSInteger pageNum;
@end


@implementation HHHomeDetailView
- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel parameters:(nonnull NSDictionary *)param
{
    self.detailviewModel=(HHHomeDetailViewModel *)viewModel;
    self.parmdict=param;
    return [super initWithViewModel:viewModel parameters:param];
}
- (void)hh_setupViews
{
    self.pageNum=0;
    self.pageSize=10;
    //设置view大小
    //初始化模型数组
    self.sumdetailModel = [[NSMutableArray alloc]init];
    self.frame=HH_MAIN_SCREEN;
    [self addSubview:self.tableview];
}
- (void)hh_bindViewModel
{
    //请求详情接口数据
    @weakify(self)
    [self.detailviewModel.requestDetailCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self)
       //获得最新的信号
        self.detailModel=(HHHomeDetailModel *)x;
        //更新UI数据
        self.listModel=self.detailModel.list;
        [self.detailHeaderView setDataModel:self.listModel];
    }];
    
    //请求详情音频条目列表接口
    [self.detailviewModel.requestApartmentAudioCommand.executionSignals.switchToLatest subscribeNext:^(HHHomeDetailAudioListModel *model) {
         @strongify(self)
        [self.sumdetailModel addObjectsFromArray:model.list];
        //刷新列表
        [self.tableview reloadData];
    }];
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setObject:@(self.pageNum) forKey:@"pageNum"];
    [dict setObject:@(self.pageSize) forKey:@"pageSize"];
    [dict addEntriesFromDictionary:self.parmdict];
    [self.willAppearSignal subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        [self.detailviewModel.requestDetailCommand execute:self.parmdict];

        // 追加任务 barrier
        [self.detailviewModel.requestApartmentAudioCommand execute:dict];

    }];
}

- (HHHomeDetailHeaerView *)detailHeaderView
{
    if (!_detailHeaderView) {
        _detailHeaderView = [[HHHomeDetailHeaerView alloc]init];
        _detailHeaderView.backgroundColor=[UIColor redColor];
    }
    return _detailHeaderView;
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
    return self.sumdetailModel.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HHHomeDetailTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    [cell setDataModel:self.sumdetailModel[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
