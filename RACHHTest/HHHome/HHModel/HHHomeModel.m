//
//  HHHomeModel.m
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHHomeModel.h"

@implementation HHHomeModel
/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
+ (NSDictionary *)hh_objectClassInArray
{
    return @{@"list":[HHHomeListModel class]};
}
@end
