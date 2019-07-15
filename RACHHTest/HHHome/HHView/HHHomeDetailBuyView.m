//
//  HHHomeDetailBuyView.m
//  RACHHTest
//
//  Created by White-C on 2019/7/15.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailBuyView.h"

@interface HHHomeDetailBuyView ()
@property (nonatomic,strong)UIButton *bottomBtn;
@property (nonatomic,strong)RACSubject *buysubject;
@end

@implementation HHHomeDetailBuyView

- (void)hh_setupViews
{
    self.frame=CGRectMake(0, HH_SCREEN_HEIGHT-40, HH_SCREEN_WIDTH, 40);
    [self addSubview:self.bottomBtn];
}
- (UIButton *)bottomBtn
{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomBtn.frame=self.bounds;
        [_bottomBtn setTitle:@"购买" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_bottomBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}
//创建信号
- (RACSubject *)buysubject
{
    if (!_buysubject) {
        _buysubject = [RACSubject subject];
    }
    return _buysubject;
}
//购买按钮点击方法
- (void)btnClick{
    //发送信号
    [self.buysubject sendNext:nil];
}
@end
