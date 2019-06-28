//
//  UIView+HHHierarchy.m
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "UIView+HHHierarchy.h"

@implementation UIView (HHHierarchy)

- (UIViewController *)hh_viewController {
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass: [UIViewController class]]){
            return (UIViewController *)responder;
        }
    }
    return nil;
}
@end
