//
//  MyBannerView.h
//  baishanghui
//
//  Created by Test on 2019/4/26.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MyBannerView;
@protocol MyBannerViewDelegate <NSObject>
/** 点击图片回调 */
- (void)cycleScrollView:(MyBannerView *_Nonnull)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

- (void)cycleScrollView:(MyBannerView *_Nonnull)cycleScrollView atItemAtIndex:(NSInteger)index;

@end


NS_ASSUME_NONNULL_BEGIN

@interface MyBannerView : UIView
//*是否无线循环，默认yes
@property (nonatomic,assign) BOOL infiniteLoop;
//*是否自动滑动，默认yes
@property (nonatomic,assign) BOOL autoScroll;
/**是否缩放，默认不缩放*/
@property (nonatomic,assign) BOOL isZoom;
//*自动滚动间隔时间，默认2s
@property (nonatomic,assign) CGFloat autoScrollTimeInterval;
//cell宽度
@property (nonatomic,assign) CGFloat itemWidth;
//cell间距
@property (nonatomic,assign) CGFloat itemSpace;
//imagView圆角，默认为0；
@property (nonatomic,assign) CGFloat imgCornerRadius;
//分页控制器
@property (nonatomic,strong) UIPageControl *pageControl;
/** 占位图，用于网络未加载到图片时 */
@property (nonatomic, strong) UIImage *placeholderImage;

@property (nonatomic,strong) NSArray *imgArr;//图片数组

@property (nonatomic,assign) float PageBottom;//下方的距离

/** cell的占位图，用于网络未加载到图片时*/
@property (nonatomic,strong) UIImage *cellPlaceholderImage;
/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;
//代理方法
@property (nonatomic,weak) id<MyBannerViewDelegate> delegate;


//初始化方法
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop imageGroups:(NSArray<NSString *> *)imageGroups;

@end

NS_ASSUME_NONNULL_END
