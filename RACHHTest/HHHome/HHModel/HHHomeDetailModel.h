//
//  HHHomeDetailModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"
#import "HHHomeListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HHHomeDetailModel : HHBaseModel
@property (nonatomic,strong)HHHomeListModel *list;
@end

NS_ASSUME_NONNULL_END
