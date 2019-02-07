//
//  MyCell.m
//  QuanMeiShi
//
//  Created by Test on 2018/12/17.
//  Copyright © 2018 eillyer. All rights reserved.
//

#import "MyCell.h"
@interface MyCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;


@end

@implementation MyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)load:(NSString *)image name:(NSString *)name{
    self.icon.image = kImageName(image);
    self.name.text = name;
}



@end
