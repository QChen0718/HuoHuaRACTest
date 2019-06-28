//
//  HHBaseModel.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"

@implementation HHBaseModel
+ (instancetype)hh_modelWithJson:(id)json
{
    return [self mj_objectWithKeyValues:json];
}
+ (instancetype)hh_modelWithDictionary:(NSDictionary *)dictionary
{
    return [self mj_objectWithKeyValues:dictionary];
}
+ (NSMutableArray *)hh_modelArrayWithJson:(id)json
{
    return [self mj_objectArrayWithKeyValuesArray:json];
}
+ (NSMutableArray *)hh_modelArrayWithArray:(NSArray *)array
{
    return [self mj_objectArrayWithKeyValuesArray:array];
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
   return [self hh_replacedKeyFromPropertyName];
}
+ (NSDictionary *)hh_replacedKeyFromPropertyName
{
    return @{};
}
+ (NSDictionary *)mj_objectClassInArray
{
    return [self hh_objectClassInArray];
}
+ (NSDictionary *)hh_objectClassInArray
{
    return @{};
}
- (id)hx_toJsonObject {
    return [self mj_JSONObject];
}

- (NSData *)hx_toJsonData {
    return [self mj_JSONData];
}

- (NSString *)hx_toJsonString {
    return [self mj_JSONString];
}

- (NSArray *)hx_propertyKeys {
    return [self jk_propertyKeys];
}
- (NSMutableDictionary *)hh_keyValues
{
    __block NSMutableDictionary *keyValue = [([self jk_propertyDictionary] ?: @{})mutableCopy];//获得字典进行深拷贝
    [keyValue enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            __block NSMutableArray *objArray = [((NSArray *)obj) mutableCopy];
            [(NSArray *)obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj isKindOfClass:[HHBaseModel class]]) {
                    [objArray replaceObjectAtIndex:idx withObject:[obj hh_keyValues]];
                }
            }];
            [keyValue setObject:objArray ?: @[] forKey:key];
        } else if ([obj isKindOfClass:[HHBaseModel class]])
        {
            [keyValue setObject:[obj hh_keyValues] ?: @{} forKey:key];
        }
    }];
    return [self removeNullElementsFromDictionary:keyValue];
}

#pragma mark - 去除null元素

- (NSMutableDictionary *)removeNullElementsFromDictionary:(NSMutableDictionary *)dictionary {
    
    for (NSString *key in dictionary.allKeys) {
        id item = dictionary[key];
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:item];
            dict = [self removeNullElementsFromDictionary:dict];
            [dictionary setObject:dict forKey:key];
        } else if ([item isKindOfClass:[NSArray class]]) {
            NSMutableArray *array = [NSMutableArray arrayWithArray:item];
            array = [self removeNullElementsFromArray:array];
            [dictionary setObject:array forKey:key];
        } else if ([item isKindOfClass:[NSString class]]) {
            NSString *string = (NSString *)item;
            if ([string isEqualToString:@"<null>"]) {
                string = @"";
                [dictionary setObject:@"" forKey:key];
            }
        } else if ([item isKindOfClass:[NSNull class]]) {
            [dictionary setObject:@"" forKey:key];
        }
    }
    
    return dictionary;
}

- (NSMutableArray *)removeNullElementsFromArray:(NSMutableArray *)array {
    
    for (NSInteger i = 0; i < array.count; i++) {
        id item = array[i];
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:item];
            dict = [self removeNullElementsFromDictionary:dict];
            [array replaceObjectAtIndex:i withObject:dict];
        }else if ([item isKindOfClass:[NSArray class]]) {
            NSMutableArray *arr = [NSMutableArray arrayWithArray:item];
            arr = [self removeNullElementsFromArray:arr];
            [array replaceObjectAtIndex:i withObject:arr];
        }
    }
    return array;
}


@end
