//
//  AccountTool.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/22.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountTool : NSObject


/**
 保存用户账号密码

 @param user 用户名
 @param password 密码
 */
+ (void)saveAndUpdataUser:(NSString *)user password:(NSString *)password;

/**
 获取用户密码

 @param user 用户名
 @return 密码
 */
+ (NSString *)getUser:(NSString *)user;

/**
 删除用户

 @param user 用户名
 */
+ (void)clearUser:(NSString *)user;

@end
