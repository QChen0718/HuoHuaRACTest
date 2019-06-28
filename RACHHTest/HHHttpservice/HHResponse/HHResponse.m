//
//  HHResponse.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHResponse.h"

@implementation HHResponse
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"responseCode":@"errno",@"body":@"msg"};
}
@end
