//
//  EillyerBaseViewController.h
//  affffffffff
//
//  Created by eillyer on 2018/9/18.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EillyerBaseViewController : UIViewController


//返回按钮
@property(nonatomic,strong) UIButton * backButton;
//导航栏标题
@property(nonatomic,strong) UILabel * navigationTitleLabel;
//导航栏右按钮（图片）
@property(nonatomic,strong) UIButton * rightButton;
//导航栏右按钮（文字）
@property(nonatomic,strong) UIButton * rightTextButton;

//为了灵活的满足不同的ViewController，将set方法放到.h文件，供子类调用
- (void)setupNavigationItem;
- (void)setBackButton;
- (void)setRightButton;
- (void)setNavigationTitleLabel;
-( void)setRightTextButton;

//返回按钮和右按钮点击方法，如果需要实现不同的方法，子类可以重新该方法
- (void)navBackClick;
- (void)navRightClick;
- (void)navRightTextClick;

//设置状态栏
- (void)setStatusBarStyles:(UIStatusBarStyle)styles;

@end
