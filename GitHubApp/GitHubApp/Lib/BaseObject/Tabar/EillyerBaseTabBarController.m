//
//  EillyerBaseTabBarController.m
//  affffffffff
//
//  Created by eillyer on 2018/9/19.
//  Copyright © 2018年 eillyer. All rights reserved.
//



#import "EillyerBaseTabBarController.h"
#import "EliiyerBaseNavigationController.h"



#import "aaa.h"
#import "asdfasdf.h"
#import "CameroViewController.h"


@interface EillyerBaseTabBarController ()

@end

@implementation EillyerBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = kTableColor;
    self.delegate = self;
    [self setingView];
}

- (void)setingView{

    aaa *home = [[aaa alloc] init];
    EliiyerBaseNavigationController *homeNavi = [[EliiyerBaseNavigationController alloc] initWithRootViewController:home];
    [self setUpOneChirldVC:homeNavi
                     image:[UIImage imageWithNameOfOriger:@"首页1"]
             selectedImage:[UIImage imageWithNameOfOriger:@"首页2"]
                     title:@"首页"];
    //
    asdfasdf *vegetable = [[asdfasdf alloc] init];
    EliiyerBaseNavigationController *waitNavi = [[EliiyerBaseNavigationController alloc] initWithRootViewController:vegetable];
    [self setUpOneChirldVC:waitNavi
                     image:[UIImage imageWithNameOfOriger:@"购物车1"]
             selectedImage:[UIImage imageWithNameOfOriger:@"购物车2"]
                     title:@"购物车"];
    //
    CameroViewController * Shared = [CameroViewController new];
    EliiyerBaseNavigationController *SharedNavi = [[EliiyerBaseNavigationController alloc] initWithRootViewController:Shared];
    [self setUpOneChirldVC:SharedNavi
                     image:[UIImage imageWithNameOfOriger:@"订单1"]
             selectedImage:[UIImage imageWithNameOfOriger:@"订单2"]
                     title:@"订单"];
    
}
- (void)setUpOneChirldVC:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    //    vc.tabBarItem.badgeValue = @"10";
    [self addChildViewController:vc];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    //    NSString  * sessionToken = Global.sharedGlobal.userInfo.session_token;
    //    if (![sessionToken length] ) {
    //        FWNavigationController *nav = (FWNavigationController *)viewController;
    //        if (nav.viewControllers.firstObject.class != [HomeViewController2 class]) {
    //            LoginViewController * login = VCForSB(@"LoginViewController");
    //            [[VYCAppControl sharedInstance].currentViewController presentViewController:NavRootVC(login) animated:YES completion:nil];
    //            return NO;
    //        }
    //    }
    return YES;
}


/*
//@implementation TabBarModel
//
//- (instancetype)initWithClass:(Class *)theClass name:(NSString *)name nomalImage:(UIImage *)nomalImage selectImage:(UIImage *)selectImage
//{
//    self = [super init];
//    if (self) {
//        self.theClass = theClass;
//        self.name = name;
//        self.defuleImage = nomalImage;
//        self.selectImage = selectImage;
//    }
//    return self;
//}
//
//@end

@interface EillyerBaseTabBarController ()<UITabBarDelegate>
//@property (nonatomic,strong) NSArray <TabBarModel *> *arr;
@end

@implementation EillyerBaseTabBarController
//
//- (void)setImage:(NSArray <NSString *>*)arr{
//
//}
//
//- (instancetype)initWithModelArr:(NSArray <TabBarModel *> *)arr
//{
//    self = [super init];
//    if (self) {
//        self.arr = [NSArray arrayWithArray:arr];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBar.tintColor = kTableColor;
    self.delegate = self;
    [self setingView];
}
 
- (void)setingView{
    
//
//    for (TabBarModel *model in self.arr) {
//
//        UIViewController *vc = model.theClass.
//
//        self setUpOneChirldVC:model.theClass image:<#(UIImage *)#> selectedImage:<#(UIImage *)#> title:<#(NSString *)#>
//    }
    
//
    MMMM *home = [[MMMM alloc] init];
    EliiyerBaseNavigationController *homeNavi = [[EliiyerBaseNavigationController alloc] initWithRootViewController:home];
    [self setUpOneChirldVC:homeNavi
                     image:[UIImage imageWithNameOfOriger:@"首页1"]
             selectedImage:[UIImage imageWithNameOfOriger:@"首页2"]
                     title:@"首页"];
//
    asdfasdf *vegetable = [[asdfasdf alloc] init];
    EliiyerBaseNavigationController *waitNavi = [[EliiyerBaseNavigationController alloc] initWithRootViewController:vegetable];
    [self setUpOneChirldVC:waitNavi
                     image:[UIImage imageWithNameOfOriger:@"购物车1"]
             selectedImage:[UIImage imageWithNameOfOriger:@"购物车2"]
                     title:@"购物车"];
//
    CameroViewController * Shared = [CameroViewController new];
    EliiyerBaseNavigationController *SharedNavi = [[EliiyerBaseNavigationController alloc] initWithRootViewController:Shared];
    [self setUpOneChirldVC:SharedNavi
                     image:[UIImage imageWithNameOfOriger:@"订单1"]
             selectedImage:[UIImage imageWithNameOfOriger:@"订单2"]
                     title:@"订单"];
//
//    UserCenterViewController *user = [[UserCenterViewController alloc] init];
//    FWNavigationController *userNavi = [[FWNavigationController alloc] initWithRootViewController:user];
//    [self setUpOneChirldVC:userNavi
//                     image:[UIImage imageWithNameOfOriger:@"我的1-2"]
//             selectedImage:[UIImage imageWithNameOfOriger:@"我的2-1"]
//                     title:@"我的"];
    
}
- (void)setUpOneChirldVC:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    //    vc.tabBarItem.badgeValue = @"10";
    [self addChildViewController:vc];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NSString  * sessionToken = Global.sharedGlobal.userInfo.session_token;
//    if (![sessionToken length] ) {
//        FWNavigationController *nav = (FWNavigationController *)viewController;
//        if (nav.viewControllers.firstObject.class != [HomeViewController2 class]) {
//            LoginViewController * login = VCForSB(@"LoginViewController");
//            [[VYCAppControl sharedInstance].currentViewController presentViewController:NavRootVC(login) animated:YES completion:nil];
//            return NO;
//        }
//    }
    return YES;
}
 
 */

@end
