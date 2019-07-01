//
//  HHLoginViewModel.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHLoginViewModel : HHBaseViewModel
//登录信号
@property (nonatomic,readonly,strong)RACCommand *loginCommand;
@property (nonatomic,strong)NSString *phone;
@property (nonatomic,strong)NSString *password;
@end

NS_ASSUME_NONNULL_END
