//
//  HHHomeTableViewCell.m
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeTableViewCell.h"
#import "HHHomeListModel.h"
@interface HHHomeTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet UILabel *audioTitle;
@property (weak, nonatomic) IBOutlet UILabel *detail;

@end

@implementation HHHomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.poster.clipsToBounds=YES;
}

- (void)setDataModel:(HHHomeListModel *)model
{
    [self.poster sd_setImageWithURL:[NSURL URLWithString:model.poster ?:@""] placeholderImage:[UIImage imageNamed:@""]];
    self.audioTitle.text = model.title ?: @"";
    self.detail.text = model.descriptions ?: @""; 
}
@end
