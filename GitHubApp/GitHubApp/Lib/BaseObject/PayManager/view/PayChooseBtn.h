//
//  PayChooseBtn.h
//  GitHubApp
//
//  Created by eillyer on 2018/11/1.
//  Copyright © 2018 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PayManager.h"


@interface PayChooseBtn : UIView

+(PayChooseBtn *)CustomView;

- (void)loadBtnType:(PayType)PayType
              frame:(CGRect)frame
             inView:(UIView *)inView;
@end

