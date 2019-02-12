//
//  AddressManagerVC.m
//  baishanghui
//
//  Created by Test on 2019/2/12.
//  Copyright © 2019 eillyer. All rights reserved.
//

#import "AddressManagerVC.h"
#import "AddressManagerModel.h"
#import "AddressManagerCell.h"
#import "AddAddressVC.h"
@interface AddressManagerVC ()

@end

@implementation AddressManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self settingData];
    [self settingView];
}
- (void)settingData{
    [self netWorking];
}
- (void)settingView{
    
    
    
    self.navigationItem.title = @"地址管理";
    
    [self.rightButton setTitle:@"╋" forState:0];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:0];
    [self setRightButton];
    
    [self settingTable];
    
    [self showOrHidenEmptyView];
    
}
- (void)backVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)settingTable{
    UINib *nib1 = [UINib nibWithNibName:@"AddressManagerCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib1 forCellReuseIdentifier:@"AddressManagerCell"];
    
    self.tableView.rowHeight = 150;
}

- (void)netWorking{
    
}


- (void)loadData{
    
}
#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddressManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressManagerCell" forIndexPath:indexPath];
    cell.nameAndPhone.text = @"1111";
    cell.address.text = @"[NSString stringWithFormat: ,model.region,model.detail_address];";
//        cell.model = model;
    
//    AddressManagerModel *model = self.arr[indexPath.section];
//    cell.nameAndPhone.text = [NSString stringWithFormat:@"%@(%@)",model.name,model.mobile];
//    cell.address.text = [NSString stringWithFormat: @"%@%@",model.region,model.detail_address];
//    cell.model = model;
//    cell.superVC = self;
//    
//    cell.selectBtn.selected = [model.isDefault isEqualToString:@"0"];
//    
//    cell.AddressManagerCellBlock = ^{
//        [self.tableView.mj_header beginRefreshing];
//    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.isChoose) {
        AddressManagerCell *cell = (AddressManagerCell*)[tableView cellForRowAtIndexPath:indexPath];

        [cell choose:cell.selectbTN];
        
        cell.AddressManagerCellBlock = ^{
            [self.navigationController popViewControllerAnimated: YES];
        };
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)navRightClick{
    AddAddressVC *vc = [AddAddressVC new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
