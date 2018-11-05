//
//  AccountTool.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/22.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "AccountTool.h"
#import "KeyChainManager.h"

@implementation AccountTool

+ (void)saveAndUpdataUser:(NSString *)user password:(NSString *)password{
    // 存储数据
    BOOL save = [KeyChainManager keyChainSaveData:password withIdentifier:user];
    if (save) {
        NSLog(@"存储/更新用户成功");
    }else {
        NSLog(@"存储/更新用户失败");
    }
}

+ (NSString *)getUser:(NSString *)user {
    return [KeyChainManager keyChainReadData:user];
}

+ (void)clearUser:(NSString *)user{
    [KeyChainManager keyChainDelete:user];
}
@end
