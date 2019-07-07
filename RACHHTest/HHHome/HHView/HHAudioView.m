//
//  HHAudioView.m
//  RACHHTest
//
//  Created by White-C on 2019/7/5.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHAudioView.h"
#import "HHAudioViewModel.h"
#import "HHAudioModel.h"
#import "HHAudioTableViewCell.h"
#define CELLID @"cellid"


@interface HHAudioView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)HHAudioViewModel *audioViewModel;
@property (nonatomic,strong)NSMutableArray *sumModelArray;
@property (nonatomic,strong)NSDictionary *params;
@property (nonatomic,assign)NSInteger pageNum;
@property (nonatomic,assign)NSInteger pageSize;

@end

@implementation HHAudioView

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel parameters:(NSDictionary *)param
{
    self.audioViewModel=(HHAudioViewModel *)viewModel;
    self.params=param;
    return [super initWithViewModel:viewModel parameters:param];
}
- (void)hh_setupViews
{
    self.frame=HH_MAIN_SCREEN;
    self.pageNum=0;
    self.pageSize=15;
    self.sumModelArray = [[NSMutableArray alloc]init];
    [self addSubview:self.tableview];
}
- (void)hh_bindViewModel
{
    [self.audioViewModel.homelistCommand.executionSignals.switchToLatest subscribeNext:^(HHAudioModel *model) {
        [self.sumModelArray addObjectsFromArray:model.list];
        [self.tableview reloadData];
    } error:^(NSError * _Nullable error) {
        
    }];
    [self loadData];
}
- (void)loadData{
    NSMutableDictionary *dict =[[NSMutableDictionary alloc]init];
    [dict setObject:@(self.pageNum) forKey:@"page"];
    [dict setObject:@(self.pageSize) forKey:@"pagesize"];
    [self.audioViewModel.homelistCommand execute:dict];
}
- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview=[[UITableView alloc]initWithFrame:HH_MAIN_SCREEN style:UITableViewStyleGrouped];
        _tableview.delegate=self;
        _tableview.dataSource=self;
        _tableview.estimatedRowHeight=44;
        _tableview.rowHeight=UITableViewAutomaticDimension;
        //注册tableview
        [_tableview registerNib:[UINib nibWithNibName:@"HHAudioTableViewCell" bundle:nil] forCellReuseIdentifier:CELLID];
    }
    return _tableview;
}
#pragma mark tableview的代理方法
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
    HHAudioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    [cell setDataModel:self.sumModelArray[indexPath.row]];
    return cell;
}
@end
