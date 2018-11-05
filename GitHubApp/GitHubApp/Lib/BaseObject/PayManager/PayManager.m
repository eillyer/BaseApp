//
//  PayManager.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/26.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "PayManager.h"

#define kWXKey @"asdfasdf"
#define kAliPayKey @"asdfasdf"


@implementation PayManager

+ (instancetype)shared{
    static PayManager *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[PayManager alloc] init];
    });
    return helper;
}



+ (void)registPayType:(PayType)payType{
    switch (payType) {
        case AlipayType:
            
            break;
        case WeChatpayType:
            [WXApi registerApp:kWXKey];
            break;
        case otherPay:
            [WXApi registerApp:kWXKey];

            break;
        case allType:
            
            break;
    }
}

+ (void)payPayType:(PayType)payType
        WechatDict:(NSDictionary *)dict
         aliPayStr:(NSString *)aliPaystr{
    
    switch (payType) {
        case AlipayType:
        {
            [[AlipaySDK defaultService] payOrder:aliPaystr fromScheme:kAliPayKey callback:^(NSDictionary *resultDic) {
                NSLog(@"%@",resultDic);
            }];
        }
            break;
        case WeChatpayType:
            {
                if ([WXApi isWXAppInstalled]) {//是否安装微信
                    PayReq *req = [[PayReq alloc] init];
                    [req setValuesForKeysWithDictionary:dict];
                    if ([WXApi sendReq:req]) {
                        NSLog(@"微信支付调取成功");
                    }else{
                        NSLog(@"微信支付调取失败");

                    }
                    
                    
                }else{
                    [AppControl showMessage:@"未安装微信" afterTime:kAlertTime];
                }
            }
            break;
            
        case otherPay:
            break;
        case allType:
            break;
    }
    
}

//微信回调
- (void)onReq:(BaseReq *)req{
    
}

- (void)onResp:(BaseResp *)resp{
    
}

//阿里支付

@end
