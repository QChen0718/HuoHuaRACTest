//
//  HHAudioModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/5.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHAudioModel.h"

@implementation HHTalklabelModel


@end

@implementation HHApprovallistModel


@end

@implementation HHAudioListModel

+ (NSDictionary *)hh_objectClassInArray
{
    return @{@"approval_list":[HHApprovallistModel class],@"talk_label":[HHTalklabelModel class]};
}

+ (NSDictionary *)hh_replacedKeyFromPropertyName
{
    return @{@"cricle_id":@"id",@"descriptions":@"description"};
}
@end

@implementation HHAudioModel

+ (NSDictionary *)hh_objectClassInArray
{
    return @{@"list":[HHAudioListModel class]};
}
@end
