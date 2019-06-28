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
@end

NS_ASSUME_NONNULL_END
