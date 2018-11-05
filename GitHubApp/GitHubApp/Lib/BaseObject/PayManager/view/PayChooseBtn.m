//
//  PayChooseBtn.m
//  GitHubApp
//
//  Created by eillyer on 2018/11/1.
//  Copyright © 2018 eillyer. All rights reserved.
//

#import "PayChooseBtn.h"
@interface PayChooseBtn ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *choose;

@property (nonatomic,assign) PayType PayType;

@end

@implementation PayChooseBtn

+(PayChooseBtn *)CustomView{
    //我们这里需要把这个xib加载出来而这个xib的所拥有者就是当前的对象`instantiateWithOwner:`这个方法就是对此xib文件进行拥有者关联，关联这个xib是属于哪一个类的我们当然这是self
    PayChooseBtn *View = [[UINib nibWithNibName:@"PayChooseBtn" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
    return View;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)chooseAction:(UIButton *)sender {
    
    [self.choose setHidden:NO];
    [PayManager shared].payType = self.PayType;
    
    
    // 发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PayChoose" object:@"TYPE变化" userInfo:@{@"TYPE":[NSNumber numberWithInteger:self.PayType]}];
    

}



- (void)loadBtnType:(PayType)PayType frame:(CGRect)frame inView:(UIView *)inView{
    
    [self loadType:PayType];
    
    self.frame = frame;
    
    [inView addSubview:self];
    
    
}


- (void)loadType:(PayType)PayType{
    
    self.PayType = PayType;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotifi:) name:@"PayChoose" object:nil];
    
    [self.choose setHidden:self.PayType != [PayManager shared].payType];
    NSString *name = @"";
    
    switch (PayType) {
        case AlipayType:
        {
            name = @"支付宝";
        }
            break;
        case WeChatpayType:
        {
            name = @"微信";

        }
            break;
        case otherPay:
        {
            name = @"钱包";

        }
            break;

        case allType: {
            name = @"全部";

        }
            break;
    }
    
    self.icon.image = kImageName(name);
    self.name.text = name;
    
}


- (void)receiveNotifi:(NSNotification *)notifi{
    NSLog(@"notifi.object-->%@",notifi.object);
    NSLog(@"实际：%@",notifi.userInfo);
    NSLog(@"123123-->%ld",(long)[PayManager shared].payType);
//    NSLog(@"123123-->%ld",(long)self.PayType);


    
    [self.choose setHidden:self.PayType != [PayManager shared].payType];

//    if ([notifi.object isEqual:[NSNumber numberWithInteger:self.PayType]]) {
//        [self.choose setHidden:NO];
//    }else{
//
//    }
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"PayChoose" object:nil];
}
@end
