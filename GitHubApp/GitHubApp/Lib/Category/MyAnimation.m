//
//  MyAnimation.m
//  全美食
//
//  Created by Test on 2018/12/25.
//  Copyright © 2018 Sasukeee7. All rights reserved.
//

#import "MyAnimation.h"

@interface MyAnimation ()
@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIDynamicItemBehavior *dynamicItemBehavior;

@end

@implementation MyAnimation

- (void)animationWithDiaoLuo:(NSArray <UIView*>*)arr inView:(UIView *)inView{
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc]initWithReferenceView:inView];
    _animator = animator;
    
    //添加重力的动态特性，使其可执行
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:arr];
    [self.animator addBehavior:gravity];
    _gravity = gravity;
    
    //添加碰撞的动态特性，使其可执行
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:arr];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    _collision = collision;
    
    //弹性
    UIDynamicItemBehavior *dynamicItemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:arr];
    dynamicItemBehavior.allowsRotation = YES;//允许旋转
    dynamicItemBehavior.elasticity = 0.8;//弹性
    [self.animator addBehavior:dynamicItemBehavior];
}

@end
