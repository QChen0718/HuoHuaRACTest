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
#import "HHBannerModel.h"
#import "HHHomeModel.h"
#define CELLID @"cellid"


@interface HHAudioView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)HHAudioViewModel *audioViewModel;
@property (nonatomic,strong)NSMutableArray *sumModelArray;
@property (nonatomic,strong)NSDictionary *params;
@property (nonatomic,assign)NSInteger pageNum;
@property (nonatomic,assign)NSInteger pageSize;
@property (nonatomic,strong)HHBannerModel *bannerModel;
@property (nonatomic,strong)HHHomeModel *audioModel;

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
    //帖子列表
    RACSignal *circleSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self.audioViewModel.homelistCommand.executionSignals.switchToLatest subscribeNext:^(HHAudioModel *model) {
            [subscriber sendNext:model];
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
        }];
        [self loadData];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    //banner列表
    RACSignal *bannerSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self.audioViewModel.homeBannerCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
            [subscriber sendNext:x];
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
        }];
        [self.audioViewModel.homeBannerCommand execute:nil];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];

    //推荐音频列表接口
    RACSignal *audioSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [self.audioViewModel.homeAudiolistcommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
            [subscriber sendNext:x];
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
        }];
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        params[@"pageNum"] = @(0);
        params[@"pageSize"] = @(3);
        [self.audioViewModel.homeAudiolistcommand execute:params];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];

    //统一处理多个信号
    [self rac_liftSelector:@selector(responseCircle:banner:audio:) withSignalsFromArray:@[circleSignal, bannerSignal, audioSignal]];
}
- (void)responseCircle:(HHAudioModel *)circle banner:(id)banner audio:(id)audio
{
    [self.sumModelArray addObjectsFromArray:circle.list];
    [self.tableview reloadData];
    self.bannerModel=(HHBannerModel *)banner;
    self.audioModel = (HHHomeModel *)audio;
    
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
@end
