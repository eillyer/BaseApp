//
//  UserInfoModel.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/22.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfoModel : BaseModel<NSCoding>


@property (nonatomic,strong) NSString * token;//token


@property (nonatomic,strong) NSString * userId;//用户id
@property (nonatomic,strong) NSString * companyName;//公司名称
@property (nonatomic,strong) NSString * companyId;//公司id
@property (nonatomic,strong) NSString * position;//职务
@property (nonatomic,strong) NSString * tel;//电话
@property (nonatomic,strong) NSString * companyType;//公司级别
@property (nonatomic,strong) NSString * userIcon;//头像
@property (nonatomic,strong) NSString * positionType;//职务级别
@property (nonatomic,strong) NSString * userName;//用户

//
//@property (nonatomic,strong) NSArray * firstImages;//引导页图片
//@property (nonatomic,strong) NSArray * homeImages;//首页图片
//@property (nonatomic,strong) NSArray * projectList;//首页图片
//@property (nonatomic,strong) NSArray * homePage;//主功能



+ (instancetype)sharedUserInfoModel;//全局访问缓存单利
+ (instancetype)sharedUserInfoModelCoding;//全局访问沙盒单利



@end
