//
//  LSCityChooseView.h
//  LSCityChoose
//
//  Created by lisonglin on 26/04/2017.
//  Copyright © 2017 lisonglin. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 
 
 __weak typeof (self) weakSelf = self;
 //选择城市
 LSCityChooseView *cityChooseView = [[LSCityChooseView alloc]initWithFrame:[UIScreen mainScreen].bounds];
 [[UIApplication sharedApplication].keyWindow addSubview:cityChooseView];
 [cityChooseView setSelectedBlock:^(NSString *province, NSString *city, NSString *area) {
 NSLog(@"%@===%@===%@",province,city,area);
 //需要反地理编码
 [weakSelf settingLocation:city];
 //        [[LocationManager sharedLocatiomManager] getLocationForAddress:[NSString stringWithFormat:@"%@%@%@",province,city,area] doAction:^(NSString *jingdu, NSString *weidu, BOOL isOK, NSString *erro) {
 //            NSLog(@"jingdu:%@\nweidu:%@",jingdu,weidu);
 //            NSLog(@"asdf");
 //        }];
 }];
 
 */

typedef void(^SelectedHandle)(NSString * province, NSString * city, NSString * area);

@interface LSCityChooseView : UIView

@property(nonatomic, copy) SelectedHandle selectedBlock;

@end
