//
//  YHSegmentView.h
//  WorkBench
//
//  Created by wanyehua on 2017/10/26.
//  Copyright © 2017年 com.bonc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YHSegementStyle ) {
    YHSegementStyleIndicate,   /**<< 指示杆类型 <<*/
    YHSegementStyleSpace      /**<< 间隔类型 <<*/
};

typedef NS_ENUM(NSUInteger, YHSegementIndicateStyle) {
    YHSegementIndicateStyleDefault,    /**<< 指示杆和按钮的标题齐平 <<*/
    YHSegementIndicateStyleFlush      /**<< 指示杆和按钮宽度齐平 <<*/
};

typedef void(^yh_indexBlock)(NSInteger index);

@interface YHSegmentView : UIView
/** 指示杆类型 */
@property (nonatomic, assign) YHSegementIndicateStyle yh_indicateStyle;
/** 背景颜色 */
@property (nonatomic, strong) UIColor *yh_bgColor;
/** 默认字体颜色 */
@property (nonatomic, strong) UIColor *yh_titleNormalColor;
/** 选中字体颜色 */
@property (nonatomic, strong) UIColor *yh_titleSelectedColor;
/** 选中指示器颜色 */
@property (nonatomic, strong) UIColor *yh_segmentTintColor;
/** 默认选中下标 */
@property (nonatomic, assign) NSInteger yh_defaultSelectIndex;
///** 默认字体大小 */
//@property (nonatomic, assign) CGFloat yh_titleNormalFont;
///** 默认选中下标 */
//@property (nonatomic, assign) CGFloat yh_titleSelectedFont;

/**
 通过给定frame，控住器数组，标题数组，segmentView风格,返回segmentView;

 @param frame frame
 @param viewControllersArr 控住器数组
 @param titleArr 标题数组
 @param style 风格样式
 @param parentViewController 父控制器
 @param indexBlock 返回点击索引
 @return segmentView
 */
- (instancetype)initWithFrame:(CGRect)frame ViewControllersArr:(NSArray *)viewControllersArr TitleArr:(NSArray *)titleArr TitleNormalSize:(CGFloat)titleNormalSize TitleSelectedSize:(CGFloat)titleSelectedSize SegmentStyle:(YHSegementStyle)style ParentViewController:(UIViewController *)parentViewController ReturnIndexBlock: (yh_indexBlock)indexBlock;

/**
  默认选中item的下标
 */
- (void)setSelectedItemAtIndex:(NSInteger)index;
/**
  根据下标改变标题的方法
 */
- (void)changeTitleWithIndex:(NSInteger)index title:(NSString *)title;



/*
 MyOrderVC *vc1 =[MyOrderVC new];
 MyOrderVC *vc2 =[MyOrderVC new];
 MyOrderVC *vc3 =[MyOrderVC new];
 MyOrderVC *vc4 =[MyOrderVC new];
 MyOrderVC *vc5 =[MyOrderVC new];
 vc1.superVC = self;
 vc2.superVC =self;
 vc3.superVC =self;
 vc4.superVC =self;
 vc5.superVC =self;
 vc1.type = ALL_ORDER;
 vc2.type = PENDING_PAYMENT;
 vc3.type = PENDING_SHIPMENT;
 vc4.type = SHIPPED;
 vc5.type = COMPLETED;
 
 YHSegmentView *segmentView = [[YHSegmentView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-SafeAreaTopHeight) ViewControllersArr:@[vc1,vc2,vc3,vc4,vc5] TitleArr:titleArr TitleNormalSize:14 TitleSelectedSize:16 SegmentStyle:YHSegementStyleIndicate ParentViewController:self ReturnIndexBlock:^(NSInteger index) {
 NSLog(@"点击了%ld模块",(long)index);
 }];
 segmentView.yh_titleNormalColor = [UIColor blackColor];
 segmentView.yh_titleSelectedColor = [UIColor blackColor];
 segmentView.yh_segmentTintColor = [UIColor blackColor];
 segmentView.yh_defaultSelectIndex = self.index;
 // segmentView.yh_titleSelectedColor = [UIColor orangeColor];
 // [segmentView setSelectedItemAtIndex:1];
 // segmentView.yh_segmentTintColor = [UIColor blueColor];
 [self.view addSubview:segmentView];
 
 
 */





@end
