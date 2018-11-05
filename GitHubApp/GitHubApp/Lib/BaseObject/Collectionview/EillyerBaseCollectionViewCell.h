//
//  EillyerBaseCollectionViewCell.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EillyerBaseCollectionViewCell : UICollectionViewCell
kPropertyString(theId);
kPropertyNSMutableDictionary(dict);
@property (nonatomic,weak) UIViewController * superVC;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@end
