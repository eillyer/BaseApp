//
//  PayAlertView.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/27.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAlertView.h"

/*
 
            使用方法
 PayAlertView *alert = [PayAlertView CustomView];
 [alert loadSub];
 [alert ToShowAlertType:bottomType];
 
 */

@interface PayAlertView : BaseAlertView
+ (PayAlertView *)CustomView;
- (void)loadSub;
@end
