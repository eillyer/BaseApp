//
//  MyAnimation.h
//  全美食
//
//  Created by Test on 2018/12/25.
//  Copyright © 2018 Sasukeee7. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^animationFinisnBlock)(BOOL finish);

@interface MyAnimation : NSObject

@property (strong , nonatomic) CALayer *layer;
@property (copy , nonatomic) animationFinisnBlock animationFinisnBlock;


/**
 单例
 
 @return self
 */
+ (instancetype)shareTool;

/**
 
 控件掉落动画<必须将这个类定义成属性，持有这个类，否则，动画无效果>
 
 @param arr 掉落的控件集合
 @param inView 在父view
 */
- (void)animationWithDiaoLuo:(NSArray <UIView*>*)arr inView:(UIView *)inView;//掉落效果，将view加到arr中

/**
 *  开始转走动画
 *
 *  @param view        添加动画的view
 *  @param rect        view 的绝对frame
 *  @param finishPoint 下落的位置
 *  @param completion 动画完成回调
 
 
 使用方法
 BaseGoogsItem *cell = (BaseGoogsItem *)[collectionView cellForItemAtIndexPath:indexPath];
 UIImageView *imageView = (UIImageView *)[cell valueForKey:@"goodsImage"];
 CGRect rect = cell.frame;
 /// 获取当前cell 相对于self.view 当前的坐标
 rect.origin.y          = rect.origin.y - collectionView.contentOffset.y;
 CGRect imageViewRect   = imageView.frame;
 imageViewRect.origin.x = rect.origin.x;
 imageViewRect.origin.y = rect.origin.y + imageViewRect.origin.y;
 [[MyAnimation shareTool] animationZhuanZouView:imageView rect:imageViewRect finisnPoint:CGPointMake(0,0) finishBlock:^(BOOL finish) {
 [self.view worningShake];
 }];
 
 
 
 */
- (void)animationZhuanZouView:(UIView *)view
                         rect:(CGRect)rect
                  finisnPoint:(CGPoint)finishPoint
                  finishBlock:(animationFinisnBlock)completion;
@end
