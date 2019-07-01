//
//  HHLoginModel.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHLoginModel.h"



@implementation HHLoginModel

static HHLoginModel *instance=nil;
/**
 归档的实现
 */
MJCodingImplementation

+ (HHLoginModel *)shareUser
{
    if (!instance)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [[super allocWithZone:NULL] init];
            
        });
    }
    
    return instance;
}

+ (id)allocWithZone:(NSZone *)zone {
    
    return [self shareUser];
}

- (id)copyWithZone:(NSZone *)zone {
    
    return self;
}
- (id)init {
    if (instance) {
        return instance;
    }
    self = [super init];
    return self;
}
- (void)saveUser {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //归档
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [userDefaults setObject:data forKey:@"user"];
    [userDefaults synchronize];
}

- (void)deleteUser {
    
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"user"];
    [userDefaults synchronize];
}
+ (instancetype)userFromFile {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [userDefaults objectForKey:@"user"];
    //解档
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}
@end
