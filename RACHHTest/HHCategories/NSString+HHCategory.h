//
//  NSString+HHCategory.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HHCategory)
/**
 HtmlData转HtmlString
 
 @param data 转换前的HtmlData数据
 @return HtmlString
 */
+ (NSString *)utf8String:(NSData *)data;

//通过控制器名称获得控制器
- (UIViewController *)stringChangeToClass:(NSString *)str ;
@end

NS_ASSUME_NONNULL_END
