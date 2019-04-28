//
//  LocationBtn.h
//  NewQMS
//
//  Created by Test on 2019/4/28.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"


/*
 [self.addressBtn loadLocationDefuleTitle:nil type:selectAlertCityType];
 
 self.addressBtn.LocationBtnBlock = ^(NSString *jingdu, NSString *weidu, CLPlacemark *weizhi, BOOL isOK, NSString *error) {
 
 };
 
 */

typedef NS_ENUM(NSInteger,LocationBtnType) {
    selectCityVCType,
    selectAlertCityType
};


typedef void(^LocationBtnBlock)(NSString *jingdu,NSString *weidu,CLPlacemark *weizhi,BOOL isOK,NSString *error);


NS_ASSUME_NONNULL_BEGIN

@interface LocationBtn : UIButton

@property (nonatomic,copy) LocationBtnBlock LocationBtnBlock;//copy 将 block 从栈区 copy 到堆区,已提供使用
@property (nonatomic,assign) LocationBtnType type;

- (void)loadLocationDefuleTitle:(nullable NSString *)title
                           type:(LocationBtnType)type;
@end

NS_ASSUME_NONNULL_END
