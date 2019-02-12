//
//  AddressManagerCell.m
//  baishanghui
//
//  Created by Test on 2019/2/12.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "AddressManagerCell.h"
#import "AddAddressVC.h"
@implementation AddressManagerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)deleteA:(id)sender {
}
- (IBAction)editor:(id)sender {
    AddAddressVC *vc = [AddAddressVC new];
    
    vc.model = self.model;
    [self.superVC.navigationController pushViewController:vc animated:YES];
}

- (IBAction)choose:(id)sender {
    
    self.selectbTN.selected = !self.selectbTN.selected;
}
@end
