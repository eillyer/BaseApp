//
//  EillyerTableCell.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EillyerTableCell : UITableViewCell
kPropertyString(theId);
kPropertyNSMutableDictionary(dict);
@property (nonatomic,weak) UIViewController * superVC;
@end
