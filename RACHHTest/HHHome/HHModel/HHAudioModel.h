//
//  HHAudioModel.h
//  RACHHTest
//
//  Created by White-C on 2019/7/5.
//  Copyright © 2019 White-C. All rights reserved.
//

#import "HHBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHTalklabelModel : HHBaseModel
@property (nonatomic,assign)NSInteger cir_id;
@property (nonatomic,assign)NSInteger is_talk_label;
@property (nonatomic,copy)NSString * name;
@property (nonatomic,copy)NSString * poster;
@end

@interface HHApprovallistModel : HHBaseModel
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSString *user_id;
@end

@interface HHAudioListModel : HHBaseModel
@property (nonatomic,copy)NSArray <HHApprovallistModel *> *approval_list;
@property (nonatomic,assign)NSInteger approvalcount;
@property (nonatomic,copy)NSString * avatar;
@property (nonatomic,copy)NSString * cir_id;
@property (nonatomic,copy)NSString * circle_description;
@property (nonatomic,copy)NSString * circle_id;
@property (nonatomic,copy)NSString * circle_name;
@property (nonatomic,copy)NSString * circle_notice;
@property (nonatomic,copy)NSString * circle_poster;
@property (nonatomic,copy)NSString * city;
@property (nonatomic,assign)NSInteger commentcount;
@property (nonatomic,copy)NSString * create_at;
@property (nonatomic,copy)NSString * descriptions;
@property (nonatomic,assign)NSInteger favoritecount;
@property (nonatomic,assign)NSInteger cricle_id;
@property (nonatomic,copy)NSString * image;
@property (nonatomic,assign)BOOL isQuit;
@property (nonatomic,assign)BOOL isReview;
@property (nonatomic,assign)BOOL isSilence;
@property (nonatomic,assign)BOOL is_anonymous;
@property (nonatomic,assign)BOOL is_approval;
@property (nonatomic,assign)BOOL is_comment;
@property (nonatomic,assign)BOOL is_concern;
@property (nonatomic,assign)BOOL is_fans;
@property (nonatomic,assign)BOOL is_favorite;
@property (nonatomic,assign)BOOL is_followed;
@property (nonatomic,assign)BOOL is_publish;
@property (nonatomic,assign)BOOL is_secret;
@property (nonatomic,assign)BOOL is_social;
@property (nonatomic,assign)BOOL is_spacial;
@property (nonatomic,assign)BOOL is_talk_publish;
@property (nonatomic,assign)BOOL is_top;
@property (nonatomic,assign)BOOL is_tourist;
@property (nonatomic,assign)BOOL is_user_manager;
@property (nonatomic,assign)BOOL is_user_secret;
@property (nonatomic,assign)BOOL is_v;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,copy)NSString *organization;
@property (nonatomic,copy)NSString *parent_circle_description;
@property (nonatomic,copy)NSString *parent_circle_id;
@property (nonatomic,copy)NSString *parent_circle_name;
@property (nonatomic,copy)NSString *parent_circle_notice;
@property (nonatomic,copy)NSString *parent_circle_poster;
@property (nonatomic,copy)NSString *parent_is_concern;
@property (nonatomic,copy)NSString *pendant;
@property (nonatomic,assign)NSInteger post_content_id;
@property (nonatomic,assign)NSInteger post_type_id;
@property (nonatomic,copy)NSArray *posters;
@property (nonatomic,copy)NSString *publish_at;
@property (nonatomic,assign)NSInteger readcount;
@property (nonatomic,assign)NSInteger sharecount;
@property (nonatomic,copy)NSArray *tags;
@property (nonatomic,copy)NSArray <HHTalklabelModel *> *talk_label;
@property (nonatomic,copy)NSString *talks;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *top_at;
@property (nonatomic,assign)NSInteger user_id;
@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *v_introduction;
@property (nonatomic,copy)NSString *weight;
@property (nonatomic,copy)NSString *weightrecommend;
@end


@interface HHAudioModel : HHBaseModel
@property (nonatomic,copy)NSArray <HHAudioListModel *> * list;
@end

NS_ASSUME_NONNULL_END
