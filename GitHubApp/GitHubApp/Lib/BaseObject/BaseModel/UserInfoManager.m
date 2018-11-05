//
//  UserInfoManager.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/23.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "UserInfoManager.h"
#import "AccountTool.h"
#import "UserInfoModel.h"

#define kUser @"user"

@interface UserInfoManager ()

kPropertyString(account);

@end

@implementation UserInfoManager




+ (void)LoginUser:(NSString *)user
         password:(NSString *)password
          Success:(void(^)(NSDictionary *dict))successBlock
            error:(void(^)(NSString *error))errorBlock{
    
    
    
    [NetWorkTo toLoginUserVC:kRootViewController user:user pwd:password Success:^(NSDictionary *dict) {
        if (dict[@"code"]) {
            [kUserDefaults setValue:user forKey:kUser];
            [AccountTool saveAndUpdataUser:user password:password];
            
            UserInfoModel *userModel = [UserInfoModel sharedUserInfoModel];
            //保存当前登陆者信息
            userModel.token = @"asdfasdf";
            
            //>>>>>>>>>>>>>>>>可以建库存储各用户信息
            //            UserInfoModel *userModel = [UserInfoModel sharedUserInfoModelCoding];
            //            //对象存储
            //            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userModel];
            //            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"UserInfoModel"];
            
            successBlock(dict);
            
        }else{
            errorBlock(dict[@"error"]);
        }
    } error:^(NSString *error) {
        errorBlock(error);
    }];
    

    
}//登录

+ (void)AutoLogin{
    
    if (![UserInfoManager isLogin]) {
        return;
    }
    
    NSString *user = [kUserDefaults valueForKey:kUser];
    NSString *password = [AccountTool getUser:user];
    
    [NetWorkTo toLoginUserVC:kRootViewController user:user pwd:password Success:^(NSDictionary *dict) {
        if (dict[@"code"]) {
            [kUserDefaults setValue:user forKey:kUser];
            [AccountTool saveAndUpdataUser:user password:password];
            
            UserInfoModel *userModel = [UserInfoModel sharedUserInfoModel];
            //保存当前登陆者信息
            userModel.token = @"asdfasdf";
            
            //>>>>>>>>>>>>>>>>可以建库存储各用户信息
            //            UserInfoModel *userModel = [UserInfoModel sharedUserInfoModelCoding];
            //            //对象存储
            //            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userModel];
            //            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"UserInfoModel"];

        }
    } error:^(NSString *error) {
    }];
}//自动登录


+ (void)logoutUser{
    
}//退出登录
+ (BOOL)isLogin{
    NSString *user = [kUserDefaults valueForKey:kUser];
    if (kStrValid(user)) {
        return YES;
    }
    return NO;
}//是否登录
+ (void)clearUser{
    
    
}//清除用户

+ (void)refreshUserInfoSuccess:(void(^)(NSDictionary *dict))successBlock{
    [NetWorkTo toUserGetMyInfo:nil Success:^(NSDictionary *dict) {
        if (dict[@"code"]) {
            UserInfoModel *userModel = [UserInfoModel sharedUserInfoModel];
            //保存当前登陆者信息
            [userModel setValuesForKeysWithDictionary:dict];
            
            //>>>>>>>>>>>>>>>>可以建库存储各用户信息
            //            UserInfoModel *userModel = [UserInfoModel sharedUserInfoModelCoding];
            //            //对象存储
            //            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userModel];
            //            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"UserInfoModel"];
            successBlock(dict);
        }
    } error:^(NSString *error) {
        
    }];

}//更新用户信息
@end
