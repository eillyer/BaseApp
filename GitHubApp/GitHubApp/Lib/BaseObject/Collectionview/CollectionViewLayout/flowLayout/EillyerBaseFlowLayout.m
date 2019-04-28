//
//  EillyerBaseFlowLayout.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "EillyerBaseFlowLayout.h"

@implementation EillyerBaseFlowLayout

- (instancetype)initWithCount:(NSInteger)count{
    self = [super init];
    self.itemSize = CGSizeMake(kScreenWidth/count-5, 223);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    return self;
}

- (instancetype)initWithCount:(NSInteger)count width:(CGFloat)width height:(CGFloat)height isH:(BOOL)isH{
    self = [super init];
    self.itemSize = CGSizeMake(width/count, height);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scrollDirection = isH?UICollectionViewScrollDirectionHorizontal:UICollectionViewScrollDirectionVertical;
    
    return self;
}

@end
