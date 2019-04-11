//
//  LocationManager.h
//  WeinanApp1
//
//  Created by julong on 2016/12/19.
//  Copyright © 2016年 eillyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


/*使用规则
 LocationManager *mag = [LocationManager sharedLocatiomManager];
 
 mag.sendValueBlock = ^(NSString *longitude, NSString *weidu, CLPlacemark *weizhi, BOOL isOK, NSString *erro) {
 
 if (isOK && erro == nil) {//定位成功
 
 }else{
 }
 };
 
 [mag findMe];
 
 */

typedef void(^sendLocationValue)(NSString *longitude,NSString *latitude,CLPlacemark *weizhi,BOOL isOK,NSString *erro);

typedef void(^getLocationValue)(NSString *longitude,NSString *latitude,BOOL isOK,NSString *erro);

@interface LocationManager : NSObject


+ (instancetype)sharedLocatiomManager;

@property (nonatomic,copy) sendLocationValue sendValueBlock;//copy 将 block 从栈区 copy 到堆区,已提供使用

@property (nonatomic,copy) getLocationValue getLocationValue;





/**
 用地址来得到经纬度

 @param address 地址
 @param action 获得位置
 */
- (void)getLocationForAddress:(NSString *)address doAction:(getLocationValue)action;

- (void)findMe;
@end
