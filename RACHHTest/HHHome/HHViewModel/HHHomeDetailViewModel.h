//
//  HHHomeDetailViewModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHHomeDetailViewModel : HHBaseViewModel
@property (nonatomic,readonly,strong)RACCommand *requestDetailCommand;
@property (nonatomic,readonly,strong)RACCommand *requestApartmentAudioCommand;
@end

NS_ASSUME_NONNULL_END
