//
//  LoginVC.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/23.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "LoginVC.h"
#import "EillyerTextField.h"
#import "UserInfoManager.h"
#import "EillyerBaseTabBarController.h"
#import "RegisterUserVC.h"
#import "ForgetPasswordVC.h"

@interface LoginVC ()<UITextFieldDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet EillyerTextField *account;
@property (weak, nonatomic) IBOutlet EillyerTextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(UIButton *)sender {
    
    if (self.account.text.length == 0 || self.password.text.length == 0) {
        [AppControl showMessage:@"请完善信息" afterTime:kAlertTime];
        return;
    }
    
    
    [UserInfoManager LoginUser:self.account.text password:self.password.text Success:^(NSDictionary *dict) {

        EillyerBaseTabBarController *vc = [[EillyerBaseTabBarController alloc] init];
        [self presentViewController:vc animated:YES completion:^{
            [UserInfoManager refreshUserInfoSuccess:^(NSDictionary *dict) {
                
            }];
        }];
        
    } error:^(NSString *error) {
    }];
    
}
- (IBAction)forget:(UIButton *)sender {
    ForgetPasswordVC *vc = [[ForgetPasswordVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)registers:(UIButton *)sender {
    
    RegisterUserVC *vc = [[RegisterUserVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    DLog(@"asdf");
//    [self.view endEditing:YES];
//
//}
//
//- (void)textViewDidEndEditing:(UITextView *)textView{
//    [textView resignFirstResponder];
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];
//}

@end
