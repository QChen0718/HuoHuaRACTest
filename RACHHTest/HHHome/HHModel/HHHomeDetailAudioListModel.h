//
//  HHHomeDetailAudioListModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/4.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHHomeDetailAudioContentModel : HHBaseModel

@property (nonatomic,copy)NSString *addr;
@property (nonatomic,assign)NSInteger audioId;
@property (nonatomic,copy)NSString *createAt;
@property (nonatomic,assign)NSInteger finished;
@property (nonatomic,assign)NSInteger audioDetail_id;
@property (nonatomic,assign)BOOL isFree;
@property (nonatomic,assign)BOOL isPublish;
@property (nonatomic,assign)BOOL isValid;
@property (nonatomic,assign)NSInteger orders;
@property (nonatomic,assign)NSInteger playThis;
@property (nonatomic,copy)NSString *playcount;
@property (nonatomic,copy)NSString *poster;
@property (nonatomic,copy)NSString *publishAt;
@property (nonatomic,copy)NSString *timeCost;
@property (nonatomic,copy)NSString *timeGone;
@property (nonatomic,copy)NSString *title;
@end



@interface HHHomeDetailAudioListModel : HHBaseModel
@property (nonatomic,copy)NSArray <HHHomeDetailAudioContentModel *> *list;
@end

NS_ASSUME_NONNULL_END
