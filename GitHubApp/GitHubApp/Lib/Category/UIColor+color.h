//
//  UIColor+color.h
//  QualityCloud
//
//  Created by julong on 2017/4/10.
//  Copyright © 2017年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (color)


//16进制颜色转换 color16 必须是char类型切0x开头
+ (UIColor *)colorWith16hux:(char)color16;



//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end
