//
//  UserInfoManager.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/23.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfoManager : BaseModel



+ (void)LoginUser:(NSString *)user
         password:(NSString *)password
          Success:(void(^)(NSDictionary *dict))successBlock
            error:(void(^)(NSString *error))errorBlock;//用户登录

+ (void)AutoLogin;//自动登录
+ (void)logoutUser;//退出登录
+ (BOOL)isLogin;//是否登录
+ (void)clearUser;//清除用户

+ (void)refreshUserInfoSuccess:(void(^)(NSDictionary *dict))successBlock;//更新用户信息
@end
