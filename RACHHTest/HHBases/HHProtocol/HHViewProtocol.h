//
//  HHViewProtocol.h
//  RACHHTest
//
//  Created by White-C on 2019/6/30.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHViewModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol HHViewModelProtocol;

@protocol HHViewProtocol <NSObject>

@optional
/**
 *  初始化并绑定ViewModel
 */
- (instancetype)initWithViewModel:(id <HHViewModelProtocol>)viewModel;
/**
 *  初始化并绑定ViewModel及传递参数
 */
- (instancetype)initWithViewModel:(id <HHViewModelProtocol>)viewModel parameters:(NSDictionary *)param;
/**
 初始化并绑定ViewModel及传递参数
 */
- (instancetype)initWithViewModel:(id <HHViewModelProtocol>)viewModel
                       parameters:(NSDictionary *)param
                           target:(UIViewController *)viewController;
/**
 *  子组件订阅信号
 */
- (void)hh_bindViewModel;

/**
 *  添加子组件 viewDidLoad
 */
- (void)hh_setupViews;
@end

NS_ASSUME_NONNULL_END
