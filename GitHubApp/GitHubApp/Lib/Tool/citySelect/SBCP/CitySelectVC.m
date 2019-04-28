//
//  CitySelectVC.m
//  baishanghui
//
//  Created by Test on 2019/3/13.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "CitySelectVC.h"
#import "NSArray+array.h"
#import "EillyerTableCell.h"
#import "LocationManager.h"

@interface CitySelectVC ()
@property (nonatomic,strong) UIButton * cityBtn;
@end

@implementation CitySelectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingData];
    [self settingView];
}
- (void)settingData{
    [self netWorking];
}
- (void)settingView{
    

    
    self.navigationItem.title = @"城市选择";
    
    [self settingTable];
    
}
- (void)backVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)settingTable{

    [self.tableView registerClass:[EillyerTableCell class] forCellReuseIdentifier:@"cell"];
    self.isHiden_mj_footer = YES;
    self.isHiden_mj_header = YES;
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 70)];
    
    self.cityBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth-200, 40)];
    [self.cityBtn setR:3 wid:1 color:kBlackColor];
    [self.cityBtn addTarget:self action:@selector(findLoction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.cityBtn setTitle:@"定位中。。" forState:0];
    self.cityBtn.center = header.center;
    [self.cityBtn setTitleColor:kBlackColor forState:0];
    header.backgroundColor = kWhiteColor;
    
    [header addSubview:self.cityBtn];
    
    
    self.tableView.tableHeaderView = header;
    
    
    [self findLoction:self.cityBtn];

}


- (void)findLoction:(UIButton *)sender{
    
    [sender setEnabled:NO];
    
    if ([sender.titleLabel.text isEqualToString:@"定位失败！"]) {
        [sender setTitle:@"定位中。。" forState:0];
    }

    
    if (sender.titleLabel.text.length > 5) {
        //已经定位
        [sender setEnabled:YES];
        
//         for (CityListModel *model in kUserInfo.citys) {
//             if ([model.city isEqualToString:[sender.titleLabel.text substringFromIndex:5]]) {
//                 NSLog(@"====%@",model.cityId);
//                 kUserInfo.selectCityId = model.cityId;
//             }
//         }
        [self.navigationController popViewControllerAnimated:YES];

        return;
    }
    
    LocationManager *mag = [LocationManager sharedLocatiomManager];
    mag.sendValueBlock = ^(NSString *jingdu, NSString *weidu, CLPlacemark *weizhi, BOOL isOK, NSString *erro) {
        [sender setEnabled:YES];

        if (isOK && erro == nil) {//定位成功
            
            [sender setTitle:[@"当前城市：" stringByAppendingString:weizhi.locality] forState:0];
//            BOOL isBao = NO;
//            for (CityListModel *model in kUserInfo.citys) {
//                if ([model.city isEqualToString:weizhi.locality]) {
//                    NSLog(@"====%@",model.cityId);
//                    kUserInfo.selectCityId = model.cityId;
//                    isBao = YES;
//                }
//            }
//
//            if (isBao) {
//                [self.backButton setTitle:[NSString stringWithFormat:@"  %@ ▽",weizhi.locality] forState:0];
//            }else{
//                [AppControl showMessage:@"所选城市暂无开放" afterTime:kAlertTime];
//            }
            
        }else{//定位失败
            [AppControl showMessage:erro afterTime:kAlertTime];

            [sender setTitle:@"定位失败！" forState:0];
        }
    };
    [mag findMe];
}

- (void)netWorking{
    
}

- (void)loadData{
    
//    NSMutableArray *arr = [NSMutableArray new];
//    for (CityListModel *model in kUserInfo.citys) {
//        [arr addObject:model.mj_keyValues];
//    }
//
//    [self.arr addObjectsFromArray:[arr returnArrWithGroupWithKey:@"letter"]];
}


#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = [NSArray arrayWithArray:self.arr[section][@"arr"]];
    return arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EillyerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray *arr = [NSArray arrayWithArray:self.arr[indexPath.section][@"arr"]];
    
    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:arr[indexPath.row]];
    
    cell.textLabel.text = dict[@"city"];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EillyerTableCell *cell = (EillyerTableCell *)[tableView cellForRowAtIndexPath:indexPath];
    
//    for (CityListModel *model in kUserInfo.citys) {
//        if ([model.city isEqualToString:cell.textLabel.text]) {
//            NSLog(@"====%@",model.cityId);
//            kUserInfo.selectCityId = model.cityId;
//        }
//    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.arr[section][@"letter"];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 10;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    NSMutableArray *arr = [NSMutableArray new];
    for (NSDictionary *dict in self.arr) {
        [arr addObject:dict[@"letter"]];
    }
    
    return arr;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//}


@end
