//
//  HHAudioTableViewCell.m
//  RACHHTest
//
//  Created by White-C on 2019/7/7.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHAudioTableViewCell.h"
#import "HHAudioModel.h"

@interface HHAudioTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *circletitle;
@property (weak, nonatomic) IBOutlet UIImageView *circlecrover;
@property (weak, nonatomic) IBOutlet UILabel *projectname;

@end

@implementation HHAudioTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.circlecrover.clipsToBounds=YES;
}

- (void)setDataModel:(HHAudioListModel *)model
{
    self.circletitle.text=model.title ?: @"";
    [self.circlecrover sd_setImageWithURL:[NSURL URLWithString:model.posters.firstObject ?: @""] placeholderImage:[UIImage imageNamed:@""]];
    self.projectname.text=model.circle_name ?: @"";
}

@end
