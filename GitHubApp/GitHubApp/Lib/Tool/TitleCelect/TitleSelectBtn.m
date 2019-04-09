//
//  TitleSelectBtn.m
//  baishanghui
//
//  Created by Test on 2019/3/28.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "TitleSelectBtn.h"
@interface TitleSelectBtn ()
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property (weak, nonatomic) IBOutlet UIView *BGView;
@property (nonatomic,strong) UIColor * titleSelectColor;
@property (nonatomic,strong) UIColor * titleDefuleColor;
@property (nonatomic,strong) UIColor * lineSelectColor;
@property (nonatomic,strong) UIColor * lineDefuleColor;
@end
@implementation TitleSelectBtn

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.BGView setR:15 wid:1 color:nil RoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)];
    [self.titleBtn setR:15 wid:1 color:nil RoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)];
}

+(TitleSelectBtn *)CustomView{
    //我们这里需要把这个xib加载出来而这个xib的所拥有者就是当前的对象`instantiateWithOwner:`这个方法就是对此xib文件进行拥有者关联，关联这个xib是属于哪一个类的我们当然这是self
    TitleSelectBtn *View = [[UINib nibWithNibName:@"TitleSelectBtn" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
    return View;
}
- (IBAction)btnAction:(UIButton *)sender {
    
    [self.superview insertSubview:self atIndex:self.superview.subviews.count-1];

    sender.selected = YES;
    
    self.line.backgroundColor = self.lineDefuleColor;

    self.BGView.backgroundColor = self.lineSelectColor;

    [self setYinyingColor:kBlackColor alpha:0.2 offsetX:2 Y:-2 radius:0];

    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TitleSelectBtnChoose" object:@"TitleSelectBtn变化" userInfo:@{@"name":sender.titleLabel.text}];

}
- (void)loadBtnTitle:(NSString *)title
              select:(BOOL)isSelect
     selectlineColor:(UIColor * __nullable)selectlineColor
     defulelineColor:(UIColor * __nullable)defulelineColor
    selectTitleColor:(UIColor * __nullable)selectTitleColor
    defuleTitleColor:(UIColor * __nullable)defuleTitleColor
               frame:(CGRect)frame
              inView:(UIView *)inView{
    
    self.lineDefuleColor = kWhiteColor;
    self.lineSelectColor = [UIColor lightGrayColor];
    self.titleDefuleColor = [UIColor lightGrayColor];
    self.titleSelectColor = [UIColor darkTextColor];

    [self.titleBtn setTitle:title forState:0];
    if (selectlineColor) {
        self.lineSelectColor = selectlineColor;
    }
    if (defulelineColor) {
        self.lineDefuleColor = defulelineColor;
    }
    if (selectTitleColor) {
        self.titleSelectColor = selectTitleColor;
    }
    if (defuleTitleColor) {
        self.titleDefuleColor = defuleTitleColor;
    }

//    [self.BGView setR:5 wid:1 color:isSelect? selectlineColor:defulelineColor];

    if (isSelect) {
        [self setYinyingColor:kBlackColor alpha:0.2 offsetX:2 Y:-2 radius:0];
    }

    [self.titleBtn setTitleColor:self.titleDefuleColor forState:UIControlStateNormal];
    [self.titleBtn setTitleColor:self.titleSelectColor forState:UIControlStateSelected];

    [self.titleBtn setSelected:isSelect];
    self.line.backgroundColor = isSelect?self.lineDefuleColor:self.lineSelectColor;
    self.BGView.backgroundColor = isSelect?self.lineSelectColor:self.lineDefuleColor;

    self.frame = frame;
    
    [inView addSubview:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotifi:) name:@"TitleSelectBtnChoose" object:nil];
}


- (void)receiveNotifi:(NSNotification *)notifi{
    NSLog(@"notifi.object-->%@",notifi.object);
    NSLog(@"实际：%@",notifi.userInfo);
    
    NSString *name = notifi.userInfo[@"name"];
    if ([name isEqualToString:self.titleBtn.titleLabel.text]) {
        return;
    }
    
    [self.titleBtn setSelected:NO];
    
    self.line.backgroundColor = self.lineSelectColor;
    
    self.BGView.backgroundColor = self.lineDefuleColor;

    [self setYinyingColor:kClearColor alpha:0.3 offsetX:0 Y:-8 radius:15];

    

}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"TitleSelectBtnChoose" object:nil];
}
@end
