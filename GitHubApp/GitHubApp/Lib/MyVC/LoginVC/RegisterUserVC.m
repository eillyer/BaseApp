//
//  RegisterUserVC.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/23.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "RegisterUserVC.h"
#import "EillyerTextField.h"
#import "SendCodeBtn.h"
@interface RegisterUserVC ()
@property (weak, nonatomic) IBOutlet EillyerTextField *name;
@property (weak, nonatomic) IBOutlet EillyerTextField *phone;
@property (weak, nonatomic) IBOutlet EillyerTextField *code;
@property (weak, nonatomic) IBOutlet EillyerTextField *pwd1;
@property (weak, nonatomic) IBOutlet EillyerTextField *pwd2;
@property (weak, nonatomic) IBOutlet EillyerTextField *tui;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UIButton *regisetBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIView *codeBtnView;

@end

@implementation RegisterUserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
- (IBAction)xieyi:(UIButton *)sender {//协议
    //协议页面
}
- (IBAction)zhuce:(UIButton *)sender {//注册
    
    if ((self.name.text.length == 0) || (self.phone.text.length == 0) ||(self.code.text.length == 0) || (self.pwd2.text.length == 0) || (self.pwd1.text.length == 0) || (self.tui.text.length == 0)) {
        [AppControl showMessage:@"请完善信息" afterTime:kAlertTime];
        return;
    }

    
    if (![self.pwd1.text isEqualToString:self.pwd2.text]) {
        [AppControl showMessage:@"密码输入有误" afterTime:kAlertTime];
        return;
    }
    
    
    [NetWorkTo toUserRegister:self inviter_mobile:self.name.text phone:self.phone.text SMS:self.code.text password:self.pwd1.text Success:^(NSDictionary *dict) {
        
    } error:^(NSString *error) {
        
    }];
    
}
- (IBAction)loginA:(UIButton *)sender {//登录
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
