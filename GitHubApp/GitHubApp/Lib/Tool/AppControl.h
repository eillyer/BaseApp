//
//  AppControl.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/23.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppControl : NSObject


/**
 单例

 @return appcontrol
 */
+ (instancetype)shared;


/**
 获取app版本

 @return 版本号
 */
+ (NSString *)getAppVersion;



/**
 提示消息

 @param msg 提示语
 @param time 时间
 */
+ (void)showMessage:(NSString *)msg afterTime:(NSTimeInterval)time;


/**
 系统弹框

 @param title 标题
 @param text 内容
 @param Action 事件处理（nil则展示取消按钮）
 */
+ (void)showSYSAlertTitle:(NSString *)title
                     text:(NSString *)text
                   Action:(void(^)(void))Action;



@end
