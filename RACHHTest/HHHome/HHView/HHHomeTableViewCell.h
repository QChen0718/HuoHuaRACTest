//
//  HHHomeTableViewCell.h
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHHomeListModel;

NS_ASSUME_NONNULL_BEGIN

@interface HHHomeTableViewCell : UITableViewCell
- (void)setDataModel:(HHHomeListModel *)model;
@end

NS_ASSUME_NONNULL_END
