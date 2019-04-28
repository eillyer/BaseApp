//
//  LocationBtn.m
//  NewQMS
//
//  Created by Test on 2019/4/28.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "LocationBtn.h"
#import "CitySelectVC.h"
//#import "LSCityChooseView.h"

#import <BRPickerView.h>

NSMutableArray *locationCity;

@implementation LocationBtn

/*
 ▽   ▼
 
 
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


- (void)loadLocationDefuleTitle:(nullable NSString *)title
                           type:(LocationBtnType)type{
    
    self.type = type;
    locationCity = [NSMutableArray new];
    
    [self setTitleColor:kTextColor forState:0];
    [self setTitleColor:kTextColor forState: UIControlStateSelected];
    
    
    //    if (type != selectAlertCityType) {
    //
    //    }
    
    if (title) {
        [self setTitle:[title stringByAppendingString:@" ▽"] forState:0];
    }else{
        [self setTitle:@"定位中..." forState:0];
    }
    
    
    [self addTarget:self action:@selector(chooseCity) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    [self findLoction:self];
    
    
}


- (void)chooseCity{
    switch (self.type) {
        case selectCityVCType:
        {
            [self pushVCChoose];
        }
            break;
            
        default:
        {
            [self alertChoose];
        }
            break;
    }
    
}

- (void)pushVCChoose{
    CitySelectVC *vc = [CitySelectVC new];
    [[self getMyViewController] presentViewController:vc animated:YES completion:nil];
}
- (void)alertChoose{
    __weak typeof (self) weakSelf = self;
    
    
    
    [BRAddressPickerView showAddressPickerWithShowType:BRAddressPickerModeArea defaultSelected:locationCity isAutoSelect:NO themeColor:nil resultBlock:^(BRProvinceModel *province, BRCityModel *city, BRAreaModel *area) {
        [weakSelf setTitle:[NSString stringWithFormat:@"  %@ ▽",city.name] forState:0];
        //需要反地理编码
        [[LocationManager sharedLocatiomManager] getLocationForAddress:[NSString stringWithFormat:@"%@%@%@",province.name,city.name,area.name] doAction:^(NSString *jingdu, NSString *weidu, CLPlacemark *place,BOOL isOK, NSString *erro) {
            
            if (weakSelf.LocationBtnBlock) {
                weakSelf.LocationBtnBlock(jingdu, weidu, place, isOK, erro);
            }
        }];
        
    } cancelBlock:^{
        NSLog(@"点击了背景视图或取消按钮");
    }];
    
    
}


- (void)findLoction:(UIButton *)sender{
    
    
    LocationManager *mag = [LocationManager sharedLocatiomManager];
    mag.sendValueBlock = ^(NSString *jingdu, NSString *weidu, CLPlacemark *weizhi, BOOL isOK, NSString *erro) {
        
        if (self.LocationBtnBlock) {
            self.LocationBtnBlock(jingdu, weidu, weizhi, isOK, erro);
        }
        if (isOK && erro == nil) {//定位成功
            
            [sender setTitle:[NSString stringWithFormat:@"  %@ ▽",weizhi.name] forState:0];
            //            province.name,city.name,area.name
            [locationCity addObjectsFromArray:@[weizhi.administrativeArea,weizhi.locality,weizhi.subLocality]];
            
        }else{//定位失败
            [AppControl showMessage:erro afterTime:kAlertTime];
            
            [sender setTitle:@"定位失败！" forState:0];
        }
    };
    [mag findMe];
}


@end
