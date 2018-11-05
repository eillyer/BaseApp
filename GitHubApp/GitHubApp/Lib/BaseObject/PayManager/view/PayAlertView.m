//
//  PayAlertView.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/27.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "PayAlertView.h"
#import "PayChooseBtn.h"

@interface PayAlertView ()
@property (weak, nonatomic) IBOutlet UIView *choose;

@end
@implementation PayAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(PayAlertView *)CustomView{
    //我们这里需要把这个xib加载出来而这个xib的所拥有者就是当前的对象`instantiateWithOwner:`这个方法就是对此xib文件进行拥有者关联，关联这个xib是属于哪一个类的我们当然这是self
    PayAlertView *View = [[UINib nibWithNibName:@"PayAlertView" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
    return View;
}

- (void)loadSub{
    PayChooseBtn *weixin = [PayChooseBtn CustomView];
    [weixin loadBtnType:WeChatpayType frame:CGRectMake(0, 0, self.width, 60) inView:self.choose];
    
    PayChooseBtn *ali = [PayChooseBtn CustomView];
    [ali loadBtnType:AlipayType frame:CGRectMake(0, 61, self.width, 60) inView:self.choose];
    
    PayChooseBtn *qianbao = [PayChooseBtn CustomView];
    [qianbao loadBtnType:otherPay frame:CGRectMake(0, 122, self.width, 60) inView:self.choose];
    
    

}

- (IBAction)pay:(id)sender {
    NSLog(@"支付 %ld",(long)[PayManager shared].payType);
    //先下单，在通过订单返回值进行支付
    [NetWorkTo toOrderAdd:kRootViewController Success:^(NSDictionary *dict) {
        //进行支付
        if ([PayManager shared].payType == otherPay) {
            //进行钱包支付
        }else{
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:dict[@"data"]];
            
            //进行支付
            [NetWorkTo toPayOrder:kRootViewController payType:1 trade_no:dic[@"trade_no"] Success:^(NSDictionary *dict1) {
                if ([PayManager shared].payType == AlipayType) {
                    //阿里支付
                    [PayManager payPayType:[PayManager shared].payType WechatDict:nil aliPayStr:dict1[@"data"][@"params"]];
                }
                if ([PayManager shared].payType == WeChatpayType){
                    //微信支付
                    [PayManager payPayType:[PayManager shared].payType WechatDict:dict1[@"data"] aliPayStr:nil];

                }
//                [PayManager payPayType:[PayManager shared].payType WechatDict:dict1[@"data"] aliPayStr:dict1[@"data"][@"params"]];
            } error:^(NSString *error) {
                
            }];
            
            
        }
    } error:^(NSString *error) {
        [AppControl showMessage:@"下单失败" afterTime:kAlertTime];
    }];
    
}


@end
