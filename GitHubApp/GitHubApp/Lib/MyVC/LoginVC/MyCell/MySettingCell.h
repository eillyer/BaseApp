//
//  MySettingCell.h
//  QuanMeiShi
//
//  Created by Test on 2018/12/21.
//  Copyright © 2018 eillyer. All rights reserved.
//

typedef void(^EillyerTableCellBlock)(BOOL isSelect);


#import "EillyerTableCell.h"
#import "MySettingModel.h"
@interface MySettingCell : EillyerTableCell

@property (nonatomic,strong) UILabel * name;
@property (nonatomic,strong) UILabel * subName;


@property (nonatomic,strong) MySettingModel * model;
@property (nonatomic,copy) EillyerTableCellBlock EillyerTableCellBlock;//copy 将 block 从栈区 copy 到堆区,已提供使用

@end
