//
//  EillyerTableCell.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "EillyerTableCell.h"

@implementation EillyerTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //        self.accessoryType = UITableViewCellAccessoryType.disclosureIndicator//箭头
    //detailDisclosureButton 箭头加感叹     checkmark 对勾   detailButton 感叹
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
