//
//  HHAudioDetailViewModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/8.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHAudioDetailViewModel : HHBaseViewModel
@property (nonatomic,readonly,strong)RACCommand *circlrDetailCommand;
@end

NS_ASSUME_NONNULL_END
