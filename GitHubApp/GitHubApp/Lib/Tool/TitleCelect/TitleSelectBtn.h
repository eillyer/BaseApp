//
//  TitleSelectBtn.h
//  baishanghui
//
//  Created by Test on 2019/3/28.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TitleSelectBtn : UIView
+(TitleSelectBtn *)CustomView;

- (void)loadBtnTitle:(NSString *)title
              select:(BOOL)isSelect
     selectlineColor:(UIColor *__nullable)selectlineColor
     defulelineColor:(UIColor *__nullable)defulelineColor
    selectTitleColor:(UIColor *__nullable)selectTitleColor
    defuleTitleColor:(UIColor *__nullable)defuleTitleColor
               frame:(CGRect)frame
              inView:(UIView *)inView;


@end

NS_ASSUME_NONNULL_END

/*
 
 TitleSelectBtn *btn2 = [TitleSelectBtn CustomView];
 [btn2 loadBtnTitle:@"换货申请" select:NO selectlineColor:nil defulelineColor:nil selectTitleColor:nil defuleTitleColor:nil frame:CGRectMake(90, 0, 90, 40) inView:self.tagView];
 
 TitleSelectBtn *btn3 = [TitleSelectBtn CustomView];
 [btn3 loadBtnTitle:@"退货申请" select:NO selectlineColor:nil defulelineColor:nil selectTitleColor:nil defuleTitleColor:nil frame:CGRectMake(180, 0, 90, 40) inView:self.tagView];
 
 TitleSelectBtn *btn1 = [TitleSelectBtn CustomView];
 [btn1 loadBtnTitle:@"维修申请" select:YES selectlineColor:nil defulelineColor:nil selectTitleColor:nil defuleTitleColor:nil frame:CGRectMake(0, 0, 90, 40) inView:self.tagView];
 
 [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotifi:) name:@"TitleSelectBtnChoose" object:nil];
 }
 
 
 - (void)receiveNotifi:(NSNotification *)notifi{
 NSLog(@"notifi.object-->%@",notifi.object);
 NSLog(@"实际：%@",notifi.userInfo);
 
 NSString *name = notifi.userInfo[@"name"];
 
 }
 
 
 */
