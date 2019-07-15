//
//  HHHomeDetailVC.h
//  RACHHTest
//
//  Created by White-C on 2019/7/2.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHHomeDetailVC : HHBaseViewController
//详情ID
//更新列表的信号
@property (nonatomic,strong,readonly) RACSubject *updateListSubject;
@property (nonatomic,assign)NSInteger audioid;
@end

NS_ASSUME_NONNULL_END
