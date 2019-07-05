//
//  HHHomeDetailAudioListModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/4.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeDetailAudioListModel.h"

@implementation HHHomeDetailAudioContentModel

+ (NSDictionary *)hh_replacedKeyFromPropertyName
{
    return @{@"audioDetail_id":@"id"};
}

@end

@implementation HHHomeDetailAudioListModel
+ (NSDictionary *)hh_objectClassInArray
{
    return @{@"list":[HHHomeDetailAudioContentModel class]};
}
@end
