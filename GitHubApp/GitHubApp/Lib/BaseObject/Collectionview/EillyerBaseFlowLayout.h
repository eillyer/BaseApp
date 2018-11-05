//
//  EillyerBaseFlowLayout.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EillyerBaseFlowLayout : UICollectionViewFlowLayout
/**
 屏幕宽度给多少item
 
 @param count 数量
 @return return value description
 */
- (instancetype)initWithCount:(NSInteger)count;



/**
 给定匡高
 
 @param count 数量
 @param width 总宽度
 @param height 单个高度
 @param isH 横向
 @return return value description
 */
- (instancetype)initWithCount:(NSInteger)count width:(CGFloat)width height:(CGFloat)height isH:(BOOL)isH;

@end
