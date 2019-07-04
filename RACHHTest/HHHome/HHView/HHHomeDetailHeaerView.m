//
//  HHHomeDetailHeaerView.m
//  RACHHTest
//
//  Created by White-C on 2019/7/3.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailHeaerView.h"
#import "HHHomeListModel.h"


@interface HHHomeDetailHeaerView ()

@property (nonatomic,strong)UIImageView *coverImageview;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UILabel *descLabel;
@property (nonatomic,strong)UILabel *nickName;

@end

@implementation HHHomeDetailHeaerView

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel
{
    return [super initWithViewModel:viewModel];
}
- (void)hh_setupViews
{
    self.frame=CGRectMake(0.f, NAVIGATION_BAR_HEIGHT, HH_SCREEN_WIDTH, KSuitFloat(135));
    [self addSubview:self.coverImageview];
    [self addSubview:self.titleLabel];
    [self addSubview:self.descLabel];
    [self addSubview:self.nickName];
    [self setupFrame];
}
- (UIImageView *)coverImageview
{
    if (!_coverImageview) {
        _coverImageview = [[UIImageView alloc]init];
    }
    return _coverImageview;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor=[UIColor whiteColor];
        _titleLabel.font=[UIFont systemFontOfSize:17.f];
        _titleLabel.numberOfLines=2;
    }
    return _titleLabel;
}
- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc]init];
        _descLabel.textColor=[UIColor whiteColor];
        _descLabel.font = [UIFont systemFontOfSize:11.f];
        _descLabel.numberOfLines=0;
    }
    return _descLabel;
}
- (UILabel *)nickName
{
    if (!_nickName) {
        _nickName = [[UILabel alloc]init];
        _nickName.textColor=[UIColor whiteColor];
        _nickName.font = [UIFont systemFontOfSize:11.f];
    }
    return _nickName;
}
- (void)setupFrame
{
    [self.coverImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(15);
        make.size.mas_equalTo(CGSizeMake(KSuitFloat(110), KSuitFloat(110)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImageview.mas_right).offset(15);
        make.top.equalTo(self.coverImageview);
        make.right.equalTo(self.mas_right).offset(-15);
//        make.height.mas_equalTo(KSuitFloat(46));
    }];
    
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(KSuitFloat(34));
    }];
    
    [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.descLabel);
        make.bottom.equalTo(self.coverImageview);
    }];
}
- (void)setDataModel:(HHHomeListModel *)listModel
{
    [self.coverImageview sd_setImageWithURL:[NSURL URLWithString:listModel.poster ?: @""] placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text=listModel.title ?: @"";
    self.descLabel.text = listModel.descriptions ?: @"";
    self.nickName.text = listModel.talkerName ?: @"";
}
@end
