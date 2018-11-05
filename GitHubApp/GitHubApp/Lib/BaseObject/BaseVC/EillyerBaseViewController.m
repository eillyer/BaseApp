//
//  EillyerBaseViewController.m
//  affffffffff
//
//  Created by eillyer on 2018/9/18.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#define COLOR_COMMON_LIGHTGRAY [UIColor groupTableViewBackgroundColor]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "EillyerBaseViewController.h"

@interface EillyerBaseViewController ()

@property (nonatomic,assign) UIStatusBarStyle statuBarStyle;

@end

@implementation EillyerBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //ViewController的背景颜色，如果整个App页面背景颜色比较统一，建议在这里设置
    self.view.backgroundColor = COLOR_COMMON_LIGHTGRAY;
    //设置导航栏
    
    //可以这里做导航栏的处理，也可以自导航的基类里面处理
    [self setupNavigationItem];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.hidesBackButton = YES;

    if (self.navigationController.viewControllers.count > 1) {
        [self setBackButton];
    }
    
        //scrollerView在导航栏透明时不下压
    if (@available(iOS 11.0, *)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    
}

-(void)setupNavigationItem{
    //导航栏背景
//    UIImage * image =  [[UIImage imageNamed:@"img_navigationbar_bg"]
//                        resizableImageWithCapInsets:UIEdgeInsetsMake(-1, 0, 0, 0) resizingMode:UIImageResizingModeStretch];
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

-(void)setBackButton{
    //设置返回按钮
    if (self.navigationController.viewControllers.count > 1) {
        UIBarButtonItem * backBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
        self.navigationItem.leftBarButtonItem = backBarButton;
    }else{
        [self.view addSubview:self.backButton];
    }

}

-(void)setRightButton{
    //设置右按钮（图片）
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

-(void)setRightTextButton{
    //设置右按钮（文字）
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.rightTextButton];
    self.navigationItem.rightBarButtonItems = @[[self getNavigationSpacerWithSpacer:0],rightBarButton];
}

-(void)setNavigationTitleLabel{
    //设置标题
    self.navigationItem.titleView = self.navigationTitleLabel;
}

-(UIBarButtonItem *)getNavigationSpacerWithSpacer:(CGFloat)spacer{
    //设置导航栏左右按钮的偏移距离
    UIBarButtonItem *navgationButtonSpacer = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                              target:nil action:nil];
    navgationButtonSpacer.width = spacer;
    return navgationButtonSpacer;
}

#pragma mark - lazy 各控件的初始化方法
-(UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 50, 40);
        [_backButton setImage:[UIImage imageNamed:@"button_nav_back"] forState:UIControlStateNormal];
        _backButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_backButton setContentEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_backButton addTarget:self action:@selector(navBackClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(0, 0, 40, 40);
        [_rightButton addTarget:self action:@selector(navRightClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

-(UIButton *)rightTextButton{
    if (!_rightTextButton) {
        _rightTextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightTextButton.frame = CGRectMake(0, 0, 60, 40);
        _rightTextButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_rightTextButton addTarget:self action:@selector(navRightTextClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightTextButton;
}

-(UILabel *)navigationTitleLabel{
    if (!_navigationTitleLabel) {
        _navigationTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 150, 30)];
        _navigationTitleLabel.font = [UIFont systemFontOfSize:17];
        _navigationTitleLabel.textColor = [UIColor whiteColor];
        _navigationTitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _navigationTitleLabel;
}

#pragma mark - click 导航栏按钮点击方法，右按钮点击方法都需要子类来实现
-(void)navBackClick{
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)navRightClick{
    
}

-(void)navRightTextClick{
    
}

- (void)setStatusBarStyles:(UIStatusBarStyle)styles{
    self.statuBarStyle = styles;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    if (self.statuBarStyle) {
        return self.statuBarStyle;
    }
    return UIStatusBarStyleDefault;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

////改变状态栏样式
//func setStatuBarStyle(barstyle:UIStatusBarStyle) {
//    self.statuBarStyle = barstyle
//    self.setNeedsStatusBarAppearanceUpdate()
//}
//
//override var preferredStatusBarStyle: UIStatusBarStyle {
//    if let  statuBarStyle = self.statuBarStyle{
//        return statuBarStyle
//    }
//    return .lightContent
//}


@end
