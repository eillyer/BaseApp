//
//  QRCodeView.h
//  QRCodeDemo
//
//  Created by Test on 2019/2/11.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*
 QRCodeView *view = [QRCodeView CustomView];
 view.superVC = self;
 view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
 [view loadViewScanString:^(NSString * scanStr) {
 NSLog(@"%@",scanStr);
 
 }];
 [self.view addSubview:view];
 
 */

@interface QRCodeView : UIView

@property (nonatomic,weak) UIViewController * superVC;

+(QRCodeView *)CustomView;


- (void)loadViewScanString:(void (^)(NSString *))Scanstr;


@end

NS_ASSUME_NONNULL_END
