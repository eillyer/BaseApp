//
//  asdfasdf.m
//  affffffffff
//
//  Created by eillyer on 2018/9/18.
//  Copyright © 2018年 eillyer. All rights reserved.
//
#import "EliiyerBaseNavigationController.h"
#import "MMMM.h"
#import "asdfasdf.h"
#import "SendCodeBtn.h"
#import "LoginVC.h"
#import "PayAlertView.h"

@interface asdfasdf ()

@end

@implementation asdfasdf

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    SendCodeBtn *btn = [SendCodeBtn CustomView];
    [btn startTime:20 BGViewColor:kRedColor textColor:kWhiteColor Frame:CGRectMake(50, 50, 100, 50) inView:self.view];
    
    btn.SendCodeBtnBlack = ^{
        DLog(@"111111");
        
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [btn reSet];
        });
        
    };
}
- (IBAction)a:(id)sender {
    
//    LoginVC *vc = [[LoginVC alloc] init];
//
////    [vc setBackButton];
//
//    [self presentViewController:vc animated:YES completion:nil];

    PayAlertView *alert = [PayAlertView CustomView];
    [alert loadSub];
    [alert ToShowAlertType:bottomType];
//    [alert loadSub];

    
    
    
}
- (IBAction)b:(id)sender {
    
    MMMM *vc = [MMMM new];
    vc.title = @"asdf";
    EliiyerBaseNavigationController *navi = [[EliiyerBaseNavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:navi animated:YES completion:nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
