//
//  HHBaseView.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseView.h"

@implementation HHBaseView

- (instancetype)init
{
    return [self initWithViewModel:nil parameters:nil target:nil];
}

- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel
{
    return [self initWithViewModel:viewModel parameters:nil target:nil];
}
- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel parameters:(NSDictionary *)param
{
    return [self initWithViewModel:viewModel parameters:param target:nil];
}
- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel parameters:(NSDictionary *)param target:(UIViewController *)viewController
{
    self =[super init];
    if (self) {
        if (param && param.count>0) {
            //(1)获取类的属性及属性对应的类型
            NSMutableArray * keys = [NSMutableArray array];
            NSMutableArray * attributes = [NSMutableArray array];
            unsigned int outCount;
            objc_property_t *propertys = class_copyPropertyList([self class], &outCount);
            for (int i = 0 ; i<outCount; i++) {
                objc_property_t property = propertys[i];
                NSString *propertyName=[NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                [keys addObject:propertyName];
                NSString *propertyAttributes = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
                [attributes addObject:propertyAttributes];
            }
            //立即释放properties指向的内存
            free(propertys);
            //(2)根据类型给属性赋值
            for (NSString * key in keys) {
                if ([param valueForKey:key] == nil) {
                    continue;
                }
                [self setValue:[param valueForKey:key] forKey:key];
            }
        }
        [self hh_setupViews];
        [self hh_bindViewModel];
    }
    return self;
}

- (void)hh_setupViews
{
    
}
- (void)hh_bindViewModel
{
    
}
- (RACSubject *)willAppearSignal
{
    if (!_willAppearSignal) {
        _willAppearSignal = [RACSubject subject];
    }
    return _willAppearSignal;
}
- (RACSubject *)didAppearSignal
{
    if (!_didAppearSignal) {
        _didAppearSignal = [RACSubject subject];
    }
    return _didAppearSignal;
}
- (RACSubject *)willDisappearSignal
{
    if (!_willDisappearSignal) {
        _willDisappearSignal =[RACSubject subject];
    }
    return _willDisappearSignal;
}
- (RACSubject *)didDisappearSignal
{
    if (!_didAppearSignal) {
        _didAppearSignal = [RACSubject subject];
    }
    return _didAppearSignal;
}


@end
