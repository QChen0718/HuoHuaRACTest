//
//  HHHomeListModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeListModel.h"

@implementation HHHomeListModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"descriptions":@"description",@"audiodetail_id":@"id"};
}
@end
