//
//  AddressManagerCell.h
//  baishanghui
//
//  Created by Test on 2019/2/12.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "EillyerTableCell.h"
#import "AddressManagerModel.h"

typedef void(^AddressManagerCellBlock)(void);



NS_ASSUME_NONNULL_BEGIN

@interface AddressManagerCell : EillyerTableCell
@property (nonatomic,copy) AddressManagerCellBlock AddressManagerCellBlock;//copy 将 block 从栈区 copy 到堆区,已提供使用

@property (nonatomic,strong) AddressManagerModel * model;

@property (weak, nonatomic) IBOutlet UILabel *nameAndPhone;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIButton *selectbTN;
- (IBAction)choose:(id)sender;


@end

NS_ASSUME_NONNULL_END
