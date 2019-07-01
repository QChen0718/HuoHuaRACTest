//
//  HHHomeModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/1.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHHomeModel : HHBaseModel
@property(nonatomic,assign)NSInteger applePayPriceId;
@property(nonatomic,copy)NSString *count;
@property(nonatomic,copy)NSString *createAt;
@property(nonatomic,copy)NSString *createBy;
@property(nonatomic,copy)NSString *descriptions;
@property(nonatomic,assign)NSInteger audiodetail_id;//音频专辑ID
@property(nonatomic,assign)BOOL isPermission; // 是否已购买
@property(nonatomic,assign)NSInteger isPublish;
@property(nonatomic,assign)NSInteger isValid;
@property(nonatomic,copy)NSString *poster;
@property(nonatomic,copy)NSString *price;//价格
@property(nonatomic,copy)NSString *coinAmount;//钬柴币
@property(nonatomic,copy)NSString *priceId;//价格ID
@property(nonatomic,copy)NSString *publishAt;
@property(nonatomic,copy)NSString *sharecount;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *updateAt;
@property(nonatomic,copy)NSString *updateBy;
@property(nonatomic,assign)NSInteger userId;
@property(nonatomic,assign)NSInteger tipTypeCode;//0.免费的专辑，1.已购买的专辑，2.未购买的
/** 更新数量 */
@property (nonatomic, assign) NSInteger updCount;
/** 更新状态 */
@property (nonatomic, assign) NSInteger updStatus;
/** 是否可赠送 */
@property (nonatomic, assign) BOOL canGift;
/** tag内容 */
@property (nonatomic, copy) NSString * tagContent;
//是否显示排行按钮和广告弹框
@property (nonatomic, assign) BOOL isList;
@property (nonatomic, copy) NSString * talkerDesc;//职位描述
@property (nonatomic, copy) NSString * talkerName;//昵称
@end

NS_ASSUME_NONNULL_END
