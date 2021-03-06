//
//  EillyerBaseTabBarController.m
//  affffffffff
//
//  Created by eillyer on 2018/9/19.
//  Copyright © 2018年 eillyer. All rights reserved.
//



#import "EillyerBaseTabBarController.h"
#import "EliiyerBaseNavigationController.h"
#import "AFNetworking.h"
#import "ServerAPIPath.h"



#import "aaa.h"
#import "asdfasdf.h"
#import "CameroViewController.h"


@interface EillyerBaseTabBarController ()

//记录上一次点击tabbar，使用时，记得先在init或viewDidLoad里 初始化 = 0

@property (nonatomic,assign) NSInteger  indexFlag;

@end

@implementation EillyerBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = kTableColor;
//    self.delegate = self;
    [self getVersionForAppStore];
    [self setingView];
    self.tabBar.translucent = NO;
    
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


//点击动画效果
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }
        //添加动画
        
        //放大效果，并回到原位
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
        animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
        [[arry[index] layer] addAnimation:animation forKey:nil];
        
        self.indexFlag = index;
    }
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

- (void)getVersionForAppStore {
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    manager.requestSerializer =[AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",@"text/javascript",nil];
    NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",APP_STORE_ID];
    [manager POST:urlStr parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *array = responseObject[@"results"];
        NSDictionary *dic = array[0];
        NSString *appStoreVersionStr = dic[@"version"];
        NSString *myVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        BOOL is = [myVersion compare:appStoreVersionStr] == NSOrderedDescending;
        
        if (is) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"myappversion"];
        }else{
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"myappversion"];
            
        }
        
        NSLog(@"！！！！！！！！！！！！！！！！！！！！！！%@",is?@"yes":@"no");
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        
    }];
    
    
}
@end
