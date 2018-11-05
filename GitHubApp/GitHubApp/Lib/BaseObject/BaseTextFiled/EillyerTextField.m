//
//  EillyerTextField.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/23.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "EillyerTextField.h"

@implementation EillyerTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor = kWhiteColor;
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0 )];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.textColor = kWhiteColor;
    [self setValue:kWhiteColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end
