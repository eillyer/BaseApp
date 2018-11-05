//
//  ForgetPasswordVC.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/25.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "ForgetPasswordVC.h"
#import "EillyerTextField.h"
#import "SendCodeBtn.h"

@interface ForgetPasswordVC ()
@property (weak, nonatomic) IBOutlet EillyerTextField *phone;
@property (weak, nonatomic) IBOutlet EillyerTextField *code;
@property (weak, nonatomic) IBOutlet EillyerTextField *pwd1;
@property (weak, nonatomic) IBOutlet EillyerTextField *pwd2;
@property (weak, nonatomic) IBOutlet UIButton *ok;
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIView *codeBtnView;

@end

@implementation ForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];

    SendCodeBtn *btn = [SendCodeBtn CustomView];
    [btn startTime:20 BGViewColor:kRedColor textColor:kWhiteColor Frame:CGRectMake(0, 0, 80, 30) inView:self.codeBtnView];
    __weak typeof (btn) weakbtn = btn;
    
    btn.SendCodeBtnBlack = ^{
        DLog(@"111111");
        if (self.phone.text.length == 0) {
            [weakbtn reSet];
        }
        
        
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            [weakbtn reSet];
        });
        
    };



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
- (IBAction)oka:(UIButton *)sender {
    
    
    if ((self.phone.text.length == 0) ||(self.code.text.length == 0) || (self.pwd2.text.length == 0) || (self.pwd1.text.length == 0)) {
        [AppControl showMessage:@"请完善信息" afterTime:kAlertTime];
        return;
    }
    
    
    if (![self.pwd1.text isEqualToString:self.pwd2.text]) {
        [AppControl showMessage:@"密码输入有误" afterTime:kAlertTime];
        return;
    }
    
    
//    [NetWorkTo toUserRegister:self inviter_mobile:self.name.text phone:self.phone.text SMS:self.code.text password:self.pwd1.text Success:^(NSDictionary *dict) {
//
//    } error:^(NSString *error) {
//
//    }];
}
- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
