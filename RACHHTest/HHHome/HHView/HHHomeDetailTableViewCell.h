//
//  HHHomeDetailTableViewCell.h
//  RACHHTest
//
//  Created by White-C on 2019/7/4.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHHomeDetailAudioContentModel;
NS_ASSUME_NONNULL_BEGIN

@interface HHHomeDetailTableViewCell : UITableViewCell
- (void)setDataModel:(HHHomeDetailAudioContentModel *)model;
@end

NS_ASSUME_NONNULL_END
