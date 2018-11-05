//
//  NetWorkTo.m
//  Share365
//
//  Created by eillyer on 2017/11/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import "NetWorkTo.h"
#import "NetWorkTemp.h"
#import "ServerAPIPath.h"
//#import "UIImage+image.h"
//#import "NSArray+array.h"

#define kLimit 10

@implementation NetWorkTo


+ (void)toLoginUserVC:(UIViewController *)vc
                 user:(NSString *)user
                  pwd:(NSString *)pwd
              Success:(void(^)(NSDictionary *dict))successBlock
                error:(void(^)(NSString *error))errorBlock{
    NSString *url = [NSString stringWithFormat:@"%@/%@?mobile=%@&platform=1",IAP_MAIN_URL,IAP_GETREGISTERMS_URL,user];
    
    NSDictionary *dic = @{@"mobile":user,
                          @"verify_code":user,
                          @"inviter_mobile":user,
                          @"password":user
                          };

    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:YES parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}

+ (void)toGetRegisterSMSVC:(UIViewController *)vc
                   phone:(NSString *)phone
                 Success:(void(^)(NSDictionary *dict))successBlock
                   error:(void(^)(NSString *error))errorBlock{
//    NSDictionary *dic = @{@"mobile":phone};
    NSString *url = [NSString stringWithFormat:@"%@/%@?mobile=%@&platform=1",IAP_MAIN_URL,IAP_GETREGISTERMS_URL,phone];
    [[NetWorkTemp sharedNetWorkTemp] getMethodWithStringsOfURL:url selfVC:vc success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    }];
    
}

+ (void)toUserRegister:(UIViewController *)vc
        inviter_mobile:(NSString *)inviter_mobile
                 phone:(NSString *)phone
                   SMS:(NSString *)SMS
              password:(NSString *)password
               Success:(void(^)(NSDictionary *dict))successBlock
                 error:(void(^)(NSString *error))errorBlock{
    NSDictionary *dic = @{@"mobile":phone,
                          @"verify_code":SMS,
                          @"inviter_mobile":inviter_mobile,
                          @"password":password
                          };
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_GETREGISTERMS_URL];
    
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];

}


+ (void)toUserLogout:(UIViewController *)vc
               phone:(NSString *)phone
             Success:(void(^)(NSDictionary *dict))successBlock
               error:(void(^)(NSString *error))errorBlock{
    NSDictionary *dic = @{@"phone":phone,
                          };
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}


+ (void)toForgetPWDGetSMS:(UIViewController *)vc
                    phone:(NSString *)phone
                  Success:(void(^)(NSDictionary *dict))successBlock
                    error:(void(^)(NSString *error))errorBlock{
    NSDictionary *dic = @{@"mobile":phone,
                          };
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];
    
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}

+ (void)toForgetPWDReset:(UIViewController *)vc
                   phone:(NSString *)phone
                     SMS:(NSString *)sms
                password:(NSString *)password
                 Success:(void(^)(NSDictionary *dict))successBlock
                   error:(void(^)(NSString *error))errorBlock{
    NSDictionary *dic = @{@"mobile":phone,
                          @"verify_code":sms,
                          @"platform":@"1",
                          @"password":password
                          };
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}


+ (void)toResetLoginPWD:(UIViewController *)vc
                 oldPWD:(NSString *)oldPWD
                 newPWD:(NSString *)newPWD
                Success:(void(^)(NSDictionary *dict))successBlock
                  error:(void(^)(NSString *error))errorBlock{
    NSDictionary *dic = @{
                          @"old_password":oldPWD,
                          @"password":newPWD
                          };
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}


+ (void)toUserGetMyInfo:(UIViewController *)vc
                Success:(void(^)(NSDictionary *dict))successBlock
                  error:(void(^)(NSString *error))errorBlock{
    NSDictionary *dic = @{
                          @"platform":@"1"
                          };
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}


+ (void)toOrderAdd:(UIViewController *)vc
           Success:(void(^)(NSDictionary *dict))successBlock
             error:(void(^)(NSString *error))errorBlock{
    NSDictionary *dic = @{
                          @"platform":@"1"
                          };
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}



+ (void)toPayOrder:(UIViewController *)vc
           payType:(theType)payType
          trade_no:(NSString *)trade_no
           Success:(void(^)(NSDictionary *dict))successBlock
             error:(void(^)(NSString *error))errorBlock{
    NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithDictionary:@{
                          @"payType":[NSNumber numberWithInteger:payType],
                          @"trade_no":trade_no,
                          }];
    //支付宝地址
    NSString *url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];

    if (payType == typt1) {
        //微信支付
        dic[@"remote_ip"] = [ServerAPIPath getIPAddress];
        //微信地址
        url = [NSString stringWithFormat:@"%@/%@",IAP_MAIN_URL,IAP_MAIN_URL];
    }
    
    
    [[NetWorkTemp sharedNetWorkTemp] postDataWithStringsOfURL:url selfVC:vc isShowProgress:NO parameters:dic success:^(NSDictionary *responseDict) {
        successBlock(responseDict);
    } error:^(NSString *error) {
        errorBlock(error);
    } number:nil];
}

@end
