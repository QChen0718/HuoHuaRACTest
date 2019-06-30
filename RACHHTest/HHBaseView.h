//
//  HHBaseView.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface HHBaseView : UIView <HHViewProtocol>
/// The `View` willAppearSignal
@property (nonatomic, readwrite, strong) RACSubject *willAppearSignal;
/// The `View` didAppearSignal
@property (nonatomic, readwrite, strong) RACSubject *didAppearSignal;
/// The `View` willDisappearSignal
@property (nonatomic, readwrite, strong) RACSubject *willDisappearSignal;
/// The `View` viewDidDisappearSignal
@property (nonatomic, readwrite, strong) RACSubject *didDisappearSignal;
@end

NS_ASSUME_NONNULL_END
