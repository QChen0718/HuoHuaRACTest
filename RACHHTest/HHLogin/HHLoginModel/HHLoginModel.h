//
//  HHLoginModel.h
//  RACHHTest
//
//  Created by White-C on 2019/6/28.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHLoginModel : HHBaseModel<NSCoding>
/** 用户ID */
@property (nonatomic, copy) NSString * user_id;
/** 用户ID */
@property (nonatomic, copy) NSString * userName;
/** 用户名 */
@property (nonatomic, copy) NSString * nickName;
/** 密码 */
@property (nonatomic, copy) NSString * password;
/** 头像 */
@property (nonatomic, copy) NSString * avatar;
/** 电话 */
@property (nonatomic, copy) NSString * phonenumber;
/** 生日 */
@property (nonatomic, copy) NSString * birthday;
/** 性别 */
@property (nonatomic, copy) NSString * gender;
/** 省份 */
@property (nonatomic, copy) NSString * province;
/** 城市 */
@property (nonatomic, copy) NSString * city;
/** 地区 */
@property (nonatomic, copy) NSString * district;
/** 地址 */
@property (nonatomic, copy) NSString * address;
/** 组织 */
@property (nonatomic, copy) NSString * organization;
/** 职位id */
@property (nonatomic, assign) NSInteger  position_id;
/** 职位名 */
@property (nonatomic, copy) NSString * position_name;
/** 信息是否完整 */
@property (nonatomic, assign) BOOL is_complete;
/** token 用户身份验证信息 */
@property (nonatomic, copy) NSString * token;
/** 本地存储 邮箱 */
@property (nonatomic, copy) NSString * user_email;
/** 是否关注 */
@property (nonatomic, assign) BOOL  is_concern;
/** 是否 是大V用户 */
@property (nonatomic, assign) NSInteger  is_v;
/** 是否 是游客 */
@property (nonatomic, assign) NSInteger  is_tourist;
/** 是否 实名认证 */
@property (nonatomic, assign) BOOL isVerification;

//声明一个单例类
+ (HHLoginModel *)shareUser;

-(void)saveUser;

-(void)deleteUser;

+ (instancetype)userFromFile;
@end

NS_ASSUME_NONNULL_END
