//
//  HHBaseViewModel.m
//  RACHHTest
//
//  Created by White-C on 2019/6/30.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseViewModel.h"

@interface HHBaseViewModel ()
/// 当前控制器
@property (nonatomic, weak, readwrite) UIViewController *viewController;
/// 传递的参数
@property (nonatomic, strong, readwrite) NSDictionary *parameters;
/// 错误信号
@property (nonatomic, readwrite, strong) RACSubject *errorSubject;
/// loading
@property (nonatomic, strong) MBProgressHUD *hud;
@end

@implementation HHBaseViewModel

- (instancetype)init {
    return [self initWithTarget:nil parameters:nil];
}

- (instancetype)initWithModel:(id)model {
    return [self initWithTarget:nil parameters:nil];
}

- (instancetype)initWithTarget:(UIViewController *)viewController{
    return [self initWithTarget:viewController parameters:nil];
}

- (instancetype)initWithTarget:(UIViewController *)viewController parameters:(NSDictionary *)param
{
    self = [super init];
    if (self) {
        if (param && param.count>0) {
            //1.获取类的属性及属性对应的类型
            NSMutableArray *keys = [NSMutableArray array];
            NSMutableArray *attributes = [NSMutableArray array];
            
            unsigned int outCount;
            //属性数组
            objc_property_t * properties = class_copyPropertyList([self class], &outCount);
            for (int i = 0; i < outCount; i ++) {
                objc_property_t property = properties[i];
                //通过property_getName函数获得属性的名字
                NSString *propertyname = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                [keys addObject:propertyname];
                //通过property_getAttributes函数可以获得属性的名字和@encode编码
                NSString *propertyAttribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
                [attributes addObject:propertyAttribute];
            }
            //立即释放properties指向的内存
            free(properties);
            //(2)根据类型给属性赋值
            //将传递过来的字典给self进行赋值
            for (NSString * key in keys) {
                if ([param valueForKey:key] == nil) continue;
                [self setValue:[param valueForKey:key] forKey:key];
            }
        }
        self.viewController=viewController;
        self.parameters = param;
        [self hh_initialize];
    }
    return self;
}
#pragma mark - 同步controller的生命周期

- (RACSubject *)willAppearSignal {
    if (!_willAppearSignal) _willAppearSignal = [RACSubject subject];
    return _willAppearSignal;
}

- (RACSubject *)didAppearSignal {
    if (!_didAppearSignal) _didAppearSignal = [RACSubject subject];
    return _didAppearSignal;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

- (RACSubject *)didDisappearSignal {
    if (!_didDisappearSignal) _didDisappearSignal = [RACSubject subject];
    return _didDisappearSignal;
}

//初始化后就调用这个方法
- (void)hh_initialize
{
    
}
@end
