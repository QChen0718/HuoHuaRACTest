//
//  HHBaseModel.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//  统一对模型做处理

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHBaseModel : NSObject <MJCoding, MJKeyValue>
/**
 *  通过json来创建一个模型
 *  @param json 字典(可以是NSDictionary、NSData、NSString)
 *  @return 新建的对象
 */
+ (instancetype)hh_modelWithJson:(id)json;
/**
 *  通过字典来创建一个模型
 *  @param dictionary 字典
 *  @return 新建的对象
 */
+ (instancetype)hh_modelWithDictionary:(NSDictionary *)dictionary;
/**
 *  通过json数组来创建一个模型数组
 *  @param json `字典数组`(可以是NSDictionary、NSData、NSString)
 *  @return 模型数组
 */
+ (NSMutableArray *)hh_modelArrayWithJson:(id)json;

/**
 *  通过数组来创建一个模型数组
 *  @param array 数组
 *  @return 模型数组
 */
+ (NSMutableArray *)hh_modelArrayWithArray:(NSArray *)array;

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
+ (NSDictionary *)hh_replacedKeyFromPropertyName;

/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 */
+ (NSDictionary *)hh_objectClassInArray;

/**
 *  将 Model 转换为 JSON 对象
 *  @return JSON 对象
 */
- (id)hh_toJsonObject;

/**
 *  将 Model 转换为 NSData
 *  @return NSData
 */
- (NSData *)hh_toJsonData;

/**
 *  将 Model 转换为 JSONString
 *  @return JSONString
 */
- (NSString *)hh_toJsonString;

/**
 *  返回所有@property声明的属性，除了只读属性，以及属性列表不包括成员变量
 *  @return 属性列表
 */
- (NSArray *)hh_propertyKeys;

/**
 *  将模型转成字典
 *  @return 字典
 */
- (NSMutableDictionary *)hh_keyValues;

@end

NS_ASSUME_NONNULL_END
