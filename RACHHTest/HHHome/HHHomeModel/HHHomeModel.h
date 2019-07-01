//
//  HHHomeModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"
#import "HHHomeListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HHHomeModel : HHBaseModel
// 音频列表
@property (nonatomic,copy)NSArray <HHHomeListModel *> *list;

@end

NS_ASSUME_NONNULL_END
