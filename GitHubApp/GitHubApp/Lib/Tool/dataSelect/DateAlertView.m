//
//  DateAlertView.m
//  QuanMeiShi
//
//  Created by Test on 2018/12/24.
//  Copyright © 2018 eillyer. All rights reserved.
//

#import "DateAlertView.h"
#import "DatePickerView.h"
@interface DateAlertView ()<DatePickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *alert;

@end
@implementation DateAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(DateAlertView *)CustomView{
    //我们这里需要把这个xib加载出来而这个xib的所拥有者就是当前的对象`instantiateWithOwner:`这个方法就是对此xib文件进行拥有者关联，关联这个xib是属于哪一个类的我们当然这是self
    DateAlertView *View = [[UINib nibWithNibName:@"DateAlertView" bundle:nil]instantiateWithOwner:self options:nil].lastObject;
    return View;
}


- (void)loadData{
    DatePickerView *view = [[DatePickerView alloc] initWithFrame:CGRectMake(0, 0, self.alert.width, self.alert.height) withTimeShowMode:ShowAllTime withIsShowTodayDate:YES];
    view.delegate = self;
    [self.alert addSubview:view];
    [self.alert setR:5 wid:0 color:nil RoundingCorners:(UIRectCornerTopLeft |UIRectCornerTopRight)];
}

- (void)DatePickerView:(NSString *)year withMonth:(NSString *)month withDay:(NSString *)day withDate:(NSString *)date withTag:(NSInteger)tag{
    //确定
    if (tag == 1001) {
        
    }else{//1002：取消

    }
    
    self.BaseAlertViewBlock(year, month, day, tag == 1001);
    
    [self removeFromSuperview];
}
@end
