//
//  HHLoginView.m
//  RACHHTest
//
//  Created by White-C on 2019/6/30.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHLoginView.h"
#import "HHLoginViewModel.h"
@interface HHLoginView ()
@property (nonatomic,strong)UITextField *phonetextField;
@property (nonatomic,strong)UITextField *passwordtextField;
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)HHLoginViewModel *loginviewModel;
@end

@implementation HHLoginView
- (instancetype)initWithViewModel:(id<HHViewModelProtocol>)viewModel
{
    self.loginviewModel=(HHLoginViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}
- (void)hh_setupViews
{
    self.frame=[[UIScreen mainScreen]bounds];
    [self createUI];
    [self setuiFrame];
}
- (void)hh_bindViewModel
{
    [self.loginviewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(HHLoginModel *user) {
        
    }];
}
- (void)createUI{
    [self addSubview:self.phonetextField];
    [self addSubview:self.passwordtextField];
    [self addSubview:self.loginBtn];
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"按钮被点击");
        //发送信号开始执行
        [self.loginviewModel.loginCommand execute:nil];
    }];
}
- (void)setuiFrame
{
    [self.phonetextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    [self.passwordtextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.phonetextField);
        make.top.equalTo(self.phonetextField.mas_bottom).offset(10);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.top.equalTo (self.passwordtextField.mas_bottom).offset(40);
    }];
}
- (UITextField *)phonetextField
{
    if (!_phonetextField) {
        _phonetextField = [[UITextField alloc]init];
        _phonetextField.placeholder=@"请输入手机号";
        _phonetextField.font =[UIFont systemFontOfSize:15];
    }
    return _phonetextField;
}
- (UITextField *)passwordtextField
{
    if (!_passwordtextField) {
        _passwordtextField = [[UITextField alloc]init];
        _passwordtextField.placeholder=@"请输入密码";
        _passwordtextField.font =[UIFont systemFontOfSize:15];
    }
    return _passwordtextField;
}

- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _loginBtn;
}

@end
