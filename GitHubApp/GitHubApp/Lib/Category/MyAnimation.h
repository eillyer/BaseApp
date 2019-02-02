//
//  MyAnimation.h
//  全美食
//
//  Created by Test on 2018/12/25.
//  Copyright © 2018 Sasukeee7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAnimation : NSObject


/**
 控件掉落动画<必须将这个类定义成属性，持有这个类，否则，动画无效果>
使用时需要将此类初始化为属性变量
 
 @property (nonatomic, strong) MyAnimation *animation;
 self.animation = [[MyAnimation alloc] init];

 @param arr 掉落的控件集合
 @param inView 在父view
 */
- (void)animationWithDiaoLuo:(NSArray <UIView*>*)arr inView:(UIView *)inView;//掉落效果，将view加到arr中
@end
