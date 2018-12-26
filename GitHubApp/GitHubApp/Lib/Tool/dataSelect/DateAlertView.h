//
//  DateAlertView.h
//  QuanMeiShi
//
//  Created by Test on 2018/12/24.
//  Copyright © 2018 eillyer. All rights reserved.
//

/*
 
 使用：
 asdf 
 DateAlertView *view = [DateAlertView CustomView];
 [view loadData];
 [view ToShowAlertType:bottomType];
 view.BaseAlertViewBlock = ^(NSString *year, NSString *month, NSString *day, BOOL isOk) {
 NSLog(@"%@--%@--%@",year,month,day);
 };
 
 */
typedef void(^BaseAlertViewBlock)(NSString *year,NSString *month,NSString *day,BOOL isOk);

#import "BaseAlertView.h"

@interface DateAlertView : BaseAlertView
@property (nonatomic,copy) BaseAlertViewBlock BaseAlertViewBlock;//copy 将 block 从栈区 copy 到堆区,已提供使用


+(DateAlertView *)CustomView;

- (void)loadData;
@end
