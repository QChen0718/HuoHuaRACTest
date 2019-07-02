//
//  HHHomeViewModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHHomeViewModel : HHBaseViewModel
//请求列表数据
@property(nonatomic,readonly,strong)RACCommand *homelistCommand;

@end

NS_ASSUME_NONNULL_END
