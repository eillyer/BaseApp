//
//  PayManager.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/26.
//  Copyright © 2018年 eillyer. All rights reserved.
//



/*
 
 
 #    pod 'WechatOpenSDK'
 #1.8.2
 #分享
 # 主模块(必须)
 pod 'mob_sharesdk'
 # UI模块(非必须，需要用到ShareSDK提供的分享菜单栏和分享编辑页面需要以下1行)
 pod 'mob_sharesdk/ShareSDKUI'
 
 # 平台SDK模块(对照一下平台，需要的加上。如果只需要QQ、微信、新浪微博，只需要以下3行)
 # pod 'mob_sharesdk/ShareSDKPlatforms/QQ'
 # pod 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'
 pod 'mob_sharesdk/ShareSDKPlatforms/WeChatFull'
 pod 'mob_sharesdk/ShareSDKExtension'
 
 <其中分享会和微信的部分冲突，可查看share的文档>
 
 1.
 导入
 libsqlite3.tbd
 JavaScriptCore.framwork
 libc++.tbd
 libz.tbd
 libicucore.tbd
 CoreMotion.framwork
 AlipaySDK.framwork
 libWeChatSDK.a
 
 //阿里
 SystemConfiguration.framework
 CoreTelephony.framework
 QuartzCore.framework
 CoreText.framework
 CoreGraphics.framework
 CFNetwork.framework
 
 2.
 白名单
 copy 在info.plist中的LSApplicationQueriesSchemes 到目标工程
 
 3.
 target -> info -> +URL types
 aliPay :url schemes 随便填
 weichatPay :wx0abb23c8f5a162f9(申请)
 
 
 微信支付
 配置：
 https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resource/res_list&verify=1&id=1417694084&token=&lang=zh_CN
 阿里支付
 https://docs.open.alipay.com/204/105295/
 
 
 
 
 
 使用：
 
 AppDelegate
 
 #import "PayManager.h"

 didfinish:
 
 [PayManager registPayType:WeChatpayType];

 
 - (BOOL)application:(UIApplication *)application
 openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
 annotation:(id)annotation {
 
 if ([url.host isEqualToString:@"safepay"]) {
 //跳转支付宝钱包进行支付，处理支付结果
 [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
 NSLog(@"result = %@",resultDic);
 }];
 }else if ([url.host isEqualToString:@"pay"]){
 [WXApi handleOpenURL:url delegate:[PayManager shared]];
 }
 return YES;
 }
 
 // NOTE: 9.0以后使用新API接口
 - (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
 {
 if ([url.host isEqualToString:@"safepay"]) {
 //跳转支付宝钱包进行支付，处理支付结果
 [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
 NSLog(@"result = %@",resultDic);
 }];
 }else if ([url.host isEqualToString:@"pay"]){//微信支付结果
 [WXApi handleOpenURL:url delegate:[PayManager shared]];
 }
 return YES;
 }
 
 
 
 
 */

#import <Foundation/Foundation.h>

#import <AlipaySDK/AlipaySDK.h>
#import "weichat/WXApi.h"

typedef NS_ENUM(NSInteger,PayType) {
    AlipayType = 0,
    WeChatpayType = 1,
    otherPay = 2,
    allType = 3
};

@interface PayManager : NSObject<WXApiDelegate>


@property (nonatomic,assign) PayType payType;

+ (instancetype)shared;

+ (void)registPayType:(PayType)payType;

+ (void)payPayType:(PayType)payType
        WechatDict:(NSDictionary *)dict
         aliPayStr:(NSString *)aliPaystr;


@end
