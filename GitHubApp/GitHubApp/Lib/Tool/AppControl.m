//
//  AppControl.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/23.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "AppControl.h"
#import "MBProgressHUD.h"


#define isiPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)


@implementation AppControl

+ (instancetype)shared{
    static AppControl *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[AppControl alloc] init];
    });
    return helper;
}


/*
 NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
 CFShow(infoDictionary);
 // app名称
 NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
 // app版本
 NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
 
 */

+ (NSString *)getAppVersion{
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    return dict[@"CFBundleShortVersionString"];
}

+ (NSString *)getUUID {
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString(nil, puuid);
    NSString *result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    return result;
}


+ (void)showMessage:(NSString *)msg afterTime:(NSTimeInterval)time{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    if (!isiPhone) {
        hud.detailsLabelFont=[UIFont systemFontOfSize:25.0];
    }
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabelText = msg.length ? msg : @"失败";
    //    hud.labelText
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:time];
}


+ (void)showSYSAlertTitle:(NSString *)title
                     text:(NSString *)text
                   Action:(void(^)(void))Action{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    
    if (Action != nil) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            Action();
        }];
        [alert addAction:action1];
    }
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [kRootViewController presentViewController:alert animated:YES completion:nil];
    
    
}



@end
