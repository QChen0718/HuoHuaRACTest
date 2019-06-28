//
//  HHURLParameters.h
//  RACHHTest
//
//  Created by White-C on 2019/6/27.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHURLParameters : NSObject
/// 是否加载loading
@property (nonatomic, readonly, assign) BOOL loading;
/// 加载loading所在视图
@property (nonatomic, readonly, strong) UIView *loadView;
/// 头部路径 （v14/order）
@property (nonatomic, readonly, strong) NSString *headpath;
/// 路径 （v14/order）
@property (nonatomic, readonly, strong) NSString *path;
/// 方法 （POST/GET）
@property (nonatomic, readonly, strong) NSString *method;
/// 参数列表(body对应的参数)
@property (nonatomic, readonly, strong) NSDictionary *parameters;

/**
 *  参数配置（统一用这个方法配置参数）
 *
 *  @param method       方法名 （GET/POST/...）
 *  @param path         路径
 *  @param parameters   请求参数
 *  @param loading      是否加载loading(默认加载在当前控制器视图)
 *  @return 返回一个参数实例
 */
+ (instancetype)hh_urlParametersWithMethod:(NSString *)method
                                  headpath:(NSString *)headpath
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters
                                   loading:(BOOL)loading;
@end

NS_ASSUME_NONNULL_END
