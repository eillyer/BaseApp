//
//  SendCodeBtn.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/25.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SendCodeBtnBlack)(void);

@interface SendCodeBtn : UIView

/**
 放入网络数据请求
 */
@property (nonatomic,copy) SendCodeBtnBlack SendCodeBtnBlack;//copy 将 block 从栈区 copy 到堆区,已提供使用

+ (SendCodeBtn *)CustomView;

/**
 基本设置

 @param time 耗时
 @param BGColor 背景颜色
 @param textColor 数字颜色
 @param frame 位置
 @param inView 添加到inView中
 */
- (void)startTime:(NSInteger)time
      BGViewColor:(UIColor *)BGColor
        textColor:(UIColor *)textColor
            Frame:(CGRect)frame
           inView:(UIView *)inView;


/**
 重置
 */
- (void)reSet;


/*
 实例：
 
    SendCodeBtn *btn = [SendCodeBtn CustomView];
    [btn startTime:20 BGViewColor:kRedColor textColor:kWhiteColor Frame:CGRectMake(50, 50, 100, 50) inView:self.view];
 
    btn.SendCodeBtnBlack = ^{
        DLog(@"111111");
 
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [btn reSet];
        });
 
    };
 
 */

@end
