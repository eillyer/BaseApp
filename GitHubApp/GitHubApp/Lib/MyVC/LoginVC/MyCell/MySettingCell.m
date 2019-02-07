//
//  MySettingCell.m
//  QuanMeiShi
//
//  Created by Test on 2018/12/21.
//  Copyright © 2018 eillyer. All rights reserved.
//

#import "MySettingCell.h"
#import <UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface MySettingCell ()
@property (nonatomic,strong) UIImageView * titleImage;
@property (nonatomic,strong) UIImageView * icon;
@property (nonatomic,strong) UIImageView * nextImage;
@property (nonatomic,strong) UISwitch * switchBtn;
@end
@implementation MySettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(MySettingModel *)model{
    _model = model;
    
    if (model.titleImage) {
        self.titleImage.image = kImageName(model.titleImage);
        [self.titleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.mas_equalTo(10);
        }];
        self.name.text = model.title;
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.titleImage.mas_right).offset(10);
        }];
        
    }else{
        self.name.text = model.title;
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.mas_equalTo(10);
        }];
        
    }
    
    if (self.EillyerTableCellBlock) {
        //开关按钮
        [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.mas_equalTo(20);
        }];
    }else{
        if (model.nextImage) {
            self.nextImage.image = kImageName(model.nextImage);
            [self.nextImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.right.mas_equalTo(20);
            }];
            self.subName.text = model.subTitle;
            [self.subName mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.right.equalTo(self).mas_equalTo(10);
            }];
            [self.icon sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:kImageName(@"50")];
            [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.right.bottom.mas_equalTo(10);
            }];
        }
    }
    

    
}

- (UIImageView *)titleImage{
    if (!_titleImage) {
        _titleImage = [[UIImageView alloc] init];
        _titleImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_titleImage];
    }
    return _titleImage;
}
-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_icon];
    }
    return _icon;
}
- (UIImageView *)nextImage{
    if (!_nextImage) {
        _nextImage = [[UIImageView alloc] init];
        _nextImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_nextImage];
    }
    return _nextImage;
}
- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.tintColor = kColorWithHex(@"#525068");
        _name.font = kFontSize(16);
        [self addSubview:_name];
    }
    return _name;
}
- (UILabel *)subName{
    if (!_subName) {
        _subName = [[UILabel alloc] init];
        _name.tintColor = kColorWithHex(@"#9599A5");
        _name.font = kFontSize(14);
        [self addSubview:_subName];
    }
    return _subName;
}

-(UISwitch *)switchBtn{
    if (!_switchBtn) {
        _switchBtn = [[UISwitch alloc] init];
        [_switchBtn addTarget:self action:@selector(switchAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_switchBtn];
    }
    return _switchBtn;
}

- (void)switchAction:(UISwitch *)sender{
    NSLog(@"%d",sender.isSelected);
}
@end
