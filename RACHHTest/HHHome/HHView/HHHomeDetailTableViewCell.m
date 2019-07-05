//
//  HHHomeDetailTableViewCell.m
//  RACHHTest
//
//  Created by White-C on 2019/7/4.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailTableViewCell.h"
#import "HHHomeDetailAudioListModel.h"

@interface HHHomeDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *audioTitle;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation HHHomeDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setDataModel:(HHHomeDetailAudioContentModel *)model
{
    self.audioTitle.text=model.title ?: @"";
    self.numberLabel.text=@"1";
    self.dateLabel.text = model.createAt;
}

@end
