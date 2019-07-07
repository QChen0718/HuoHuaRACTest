//
//  HHAudioTableViewCell.h
//  RACHHTest
//
//  Created by White-C on 2019/7/7.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHAudioListModel;
NS_ASSUME_NONNULL_BEGIN

@interface HHAudioTableViewCell : UITableViewCell
- (void)setDataModel:(HHAudioListModel *)model;
@end

NS_ASSUME_NONNULL_END
