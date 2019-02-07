//
//  MyCell.h
//  QuanMeiShi
//
//  Created by Test on 2018/12/17.
//  Copyright © 2018 eillyer. All rights reserved.
//

#import "EillyerTableCell.h"

@interface MyCell : EillyerTableCell
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;

- (void)load:(NSString *)image name:(NSString *)name;

@end
