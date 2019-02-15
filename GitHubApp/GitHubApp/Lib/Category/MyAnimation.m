//
//  MyAnimation.m
//  全美食
//
//  Created by Test on 2018/12/25.
//  Copyright © 2018 Sasukeee7. All rights reserved.
//

#import "MyAnimation.h"

@interface MyAnimation ()<CAAnimationDelegate>
@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior;
@property (nonatomic, strong) UIGravityBehavior *gravity;
@property (nonatomic, strong) UICollisionBehavior *collision;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIDynamicItemBehavior *dynamicItemBehavior;

@end

@implementation MyAnimation

+ (instancetype)shareTool{
    static MyAnimation *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[MyAnimation alloc] init];
    });
    return helper;
}
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



#pragma public function
- (void)animationZhuanZouView:(UIView *)view
                         rect:(CGRect)rect
                  finisnPoint:(CGPoint)finishPoint
                  finishBlock:(animationFinisnBlock)completion
{
    //图层
    _layer = [CALayer layer];
    _layer.contents = view.layer.contents;
    _layer.contentsGravity = kCAGravityResizeAspectFill;
    rect.size.width  = rect.size.width;
    rect.size.height = rect.size.height;   //重置图层尺寸
    _layer.bounds = rect;
    //    _layer.cornerRadius  = rect.size.width/2;
    //    _layer.masksToBounds = YES;          //圆角
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow.layer addSublayer:_layer];
    _layer.position = CGPointMake(rect.origin.x+view.frame.size.width/2, CGRectGetMidY(rect)); //a 点
    /// 路径
    [self createAnimationwithRect:rect finishPoint:finishPoint];
    /// 回调
    if (completion) {
        _animationFinisnBlock = completion;
    }
}

#pragma mark - private function
/// 创建动画
- (void)createAnimationwithRect:(CGRect)rect
                    finishPoint:(CGPoint)finishPoint {
    /// 路径动画
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_layer.position];
    [path addQuadCurveToPoint:finishPoint controlPoint:CGPointMake(kScreenWidth/2, rect.origin.y-80)];
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.path = path.CGPath;
    /// 旋转动画
    CABasicAnimation *rotateAnimation   = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.removedOnCompletion = YES;
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
    rotateAnimation.toValue   = [NSNumber numberWithFloat:12];
    rotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    /// 缩放动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.removedOnCompletion = YES;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.25]; // 结束时的倍率
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    /// 添加动画动画组合
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[pathAnimation,rotateAnimation,scaleAnimation];
    groups.duration = 1.0f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [_layer addAnimation:groups forKey:@"group"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [_layer animationForKey:@"group"]) {
        [_layer removeFromSuperlayer];
        _layer = nil;
        if (_animationFinisnBlock) {
            _animationFinisnBlock(YES);
        }
    }
}
@end
