//
//  NetWorkTo.h
//  Share365
//
//  Created by eillyer on 2017/11/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//
/*
 
 
 */

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,theType) {
   typt1,
   typt2,
   typt3
};


typedef NS_OPTIONS(NSInteger,anWeiYu) {
    typt11                                = 1,
    typt21                                = 1 << 1,
    typt31                                = 1 << 2
};


#import <Foundation/Foundation.h>

@interface NetWorkTo : NSObject
//@property (nonatomic,assign) cardType cardType;




/**
 登录

 @param vc vc description
 @param user 账号
 @param pwd 密码
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
+ (void)toLoginUserVC:(UIViewController *)vc
                     user:(NSString *)user
                     pwd:(NSString *)pwd
                   Success:(void(^)(NSDictionary *dict))successBlock
                     error:(void(^)(NSString *error))errorBlock;

/**
 用户注册获取验证码 [phone:电话号码]
 
 @param vc 当前vc，当传入参数显示小菊花，不传入不显示
 @param phone 参数：电话号码
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
+ (void)toGetRegisterSMSVC:(UIViewController *)vc
                phone:(NSString *)phone
              Success:(void(^)(NSDictionary *dict))successBlock
                error:(void(^)(NSString *error))errorBlock;


/**
 注册

 @param vc vc description
 @param inviter_mobile 手机
 @param phone 手机
 @param SMS 短信
 @param password 密码
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
+ (void)toUserRegister:(UIViewController *)vc
        inviter_mobile:(NSString *)inviter_mobile
                 phone:(NSString *)phone
                   SMS:(NSString *)SMS
              password:(NSString *)password
               Success:(void(^)(NSDictionary *dict))successBlock
                 error:(void(^)(NSString *error))errorBlock;


/**
 用户退出登录 [phone:电话]
 
 
 @param vc 当前vc，当传入参数显示小菊花，不传入不显示
 @param phone 参数：电话
 @param successBlock successBlock
 @param errorBlock errorBlock视频
 */
+ (void)toUserLogout:(UIViewController *)vc
               phone:(NSString *)phone
             Success:(void(^)(NSDictionary *dict))successBlock
               error:(void(^)(NSString *error))errorBlock;



/**
 忘记密码（重置密码）发送验证码 [phone:电话]
 
 @param vc 当前vc，当传入参数显示小菊花，不传入不显示
 @param phone 参数：电话
 @param successBlock successBlock
 @param errorBlock errorBlock
 */
+ (void)toForgetPWDGetSMS:(UIViewController *)vc
                    phone:(NSString *)phone
                  Success:(void(^)(NSDictionary *dict))successBlock
                    error:(void(^)(NSString *error))errorBlock;



/**
 忘记密码重置密码 [phone:电话;sms:短信验证码;password:密码]
 
 @param vc 当前vc，当传入参数显示小菊花，不传入不显示
 @param phone 参数：电话
 @param sms 参数：短信验证码
 @param password 参数：密码
 @param successBlock successBlock
 @param errorBlock errorBlock
 */
+ (void)toForgetPWDReset:(UIViewController *)vc
                   phone:(NSString *)phone
                     SMS:(NSString *)sms
                password:(NSString *)password
                 Success:(void(^)(NSDictionary *dict))successBlock
                   error:(void(^)(NSString *error))errorBlock;





/**
 修改登录密码 [token:会话ID;oldPWD:原始密码;newPWD:修改密码]
 
 @param vc 当前vc，当传入参数显示小菊花，不传入不显示
 @param oldPWD 参数：原始密码
 @param newPWD 参数：修改密码
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
+ (void)toResetLoginPWD:(UIViewController *)vc
                 oldPWD:(NSString *)oldPWD
                 newPWD:(NSString *)newPWD
                Success:(void(^)(NSDictionary *dict))successBlock
                  error:(void(^)(NSString *error))errorBlock;



/**
 获取个人信息
 
 @param vc 当前vc，当传入参数显示小菊花，不传入不显示
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
+ (void)toUserGetMyInfo:(UIViewController *)vc
                Success:(void(^)(NSDictionary *dict))successBlock
                  error:(void(^)(NSString *error))errorBlock;



/**
 下单

 @param vc vc description
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
+ (void)toOrderAdd:(UIViewController *)vc
           Success:(void(^)(NSDictionary *dict))successBlock
             error:(void(^)(NSString *error))errorBlock;


/**
 支付

 @param vc vc description
 @param payType 支付方式（支付宝和微信）
 @param trade_no 订单
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
+ (void)toPayOrder:(UIViewController *)vc
           payType:(theType)payType
          trade_no:(NSString *)trade_no
           Success:(void(^)(NSDictionary *dict))successBlock
             error:(void(^)(NSString *error))errorBlock;

@end

