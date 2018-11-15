//
//  SendCodeBtn.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/25.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "SendCodeBtn.h"
@interface SendCodeBtn ()
@property (weak, nonatomic) IBOutlet UILabel *text;

@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,assign) NSInteger allTime;
@property (nonatomic,assign) NSInteger tempTime;
@property (weak, nonatomic) IBOutlet UIButton *btn;



@end
@implementation SendCodeBtn
- (IBAction)send:(UIButton *)sender {
    self.text.text = [NSString stringWithFormat:@"%ld s",self.allTime];
    [sender setHidden:YES];
    if (self.SendCodeBtnBlack != nil) {
        self.SendCodeBtnBlack();
    }
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(loopTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}


+(SendCodeBtn *)CustomView{
    //我们这里需要把这个xib加载出来而这个xib的所拥有者就是当前的对象`instantiateWithOwner:`这个方法就是对此xib文件进行拥有者关联，关联这个xib是属于哪一个类的我们当然这是self
    SendCodeBtn *View = [[UINib nibWithNibName:@"SendCodeBtn" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
    return View;
}

- (void)startTime:(NSInteger)time
      BGViewColor:(UIColor *)BGColor
        textColor:(UIColor *)textColor
            Frame:(CGRect)frame
           inView:(UIView *)inView{
    self.allTime = time;
    self.tempTime = time;
    self.text.backgroundColor = BGColor;
    self.text.textColor = textColor;
    self.frame = frame;
    [inView addSubview:self];
}

- (void)reSet{
    self.tempTime = 0;
}


- (void)loopTime{
    self.tempTime -= 1;
    if (self.tempTime < 1) {
        self.tempTime = self.allTime;
        [self.timer invalidate];
        self.timer = nil;
        [self.btn setHidden:NO];
        self.text.text = @"获取验证码";
    }else{
        [self.btn setHidden:YES];
        self.text.text = [NSString stringWithFormat:@"%ld s",self.tempTime];
    }
}

@end
