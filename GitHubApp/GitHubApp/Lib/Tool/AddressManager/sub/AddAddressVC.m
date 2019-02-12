//
//  AddAddressVC.m
//  baishanghui
//
//  Created by Test on 2019/2/12.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "AddAddressVC.h"
#import "LSCityChooseView.h"

@interface AddAddressVC ()<UITextViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIButton *city;
@property (weak, nonatomic) IBOutlet UITextView *address;
@property (weak, nonatomic) IBOutlet UISwitch *isNomal;
@property (weak, nonatomic) IBOutlet UIButton *save;


@property (nonatomic,assign) BOOL isAdd;



@end

@implementation AddAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingData];
    [self settingView];
}
- (void)settingData{
    [self netWorking];
}
- (void)settingView{
    
    [self.save setR:22 wid:0 color:[UIColor clearColor]];
    
    if (self.model == nil) {
        self.navigationItem.title = @"添加地址";
        self.isAdd = YES;
    }else{
        self.navigationItem.title = @"修改地址";
        self.name.text = self.model.name;
        self.phone.text = self.model.mobile;
        [self.city setTitle:[self.model.region stringByAppendingString:@"  〉"] forState:0];
        self.address.text = self.model.detail_address;
        [self.isNomal setOn:[self.model.isDefault isEqualToString:@"1"]];
        
        self.isAdd = NO;

    }
    
    
    
}

- (void)netWorking{
    
}
- (IBAction)addressAction:(UIButton *)sender {
    [self setEditing:NO];
    
    LSCityChooseView *cityChooseView = [[LSCityChooseView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication].keyWindow addSubview:cityChooseView];
    [cityChooseView setSelectedBlock:^(NSString *province, NSString *city, NSString *area) {
        NSLog(@"%@===%@===%@",province,city,area);
        
        [sender setTitle:[NSString stringWithFormat:@"%@%@%@",province,city,area] forState:0];
        //需要反地理编码
        //        [weakSelf settingLocation:city];
        //        [[LocationManager sharedLocatiomManager] getLocationForAddress:[NSString stringWithFormat:@"%@%@%@",province,city,area] doAction:^(NSString *jingdu, NSString *weidu, BOOL isOK, NSString *erro) {
        //            NSLog(@"jingdu:%@\nweidu:%@",jingdu,weidu);
        //            NSLog(@"asdf");
        //        }];
    }];
    
}
- (IBAction)save:(UIButton *)sender {
    if (!self.name.text.length || !self.phone.text.length||!self.city.titleLabel.text.length||!self.address.text.length) {
        [AppControl showMessage:@"请完善信息" afterTime:kAlertTime];
        return;
    }
    
    if (self.isAdd) {
        //数据上传
    }
    
    
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@"请输入详细地址信息，如街道、小区、楼栋号、单元室等"]) {
        textView.text = @"";
        textView.textColor = kColorWithHex(@"#333333");
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self setEditing:YES];
}

@end
