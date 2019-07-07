//
//  HHAudioViewModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/5.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHAudioViewModel : HHBaseViewModel
//加载帖子列表
@property (nonatomic,readonly,strong)RACCommand *homelistCommand;
//加载轮播图
@property (nonatomic,readonly,strong)RACCommand *homeBannerCommand;
//推荐音频列表
@property (nonatomic,readonly,strong)RACCommand *homeAudiolistcommand;
@end

NS_ASSUME_NONNULL_END
