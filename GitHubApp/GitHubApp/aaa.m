//
//  aaa.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "aaa.h"
#import "SendCodeBtn.h"

#import "NetWorkTo.h"
@interface aaa ()

@end

@implementation aaa

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NetWorkTo toUserLogout:self phone:@"133333333" Success:^(NSDictionary *dict) {
        
    } error:^(NSString *error) {
        
    }];
    
    EillyerBaseFlowLayout *flowLayout = [[EillyerBaseFlowLayout alloc] initWithCount:3 width:kScreenWidth-20 height:130 isH:NO];
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.collectionView registerClass:[EillyerBaseCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    __weak typeof (self) weakSelf = self;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [weakSelf.collectionView reloadData];
    });
    
    

    
}

- (void)loadData{
    [self.arr addObjectsFromArray:@[@"asdf",@"asdf",@"asdf",@"asdf",@"asdf"]];
    
    

}


#pragma mark - CollectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.arr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EillyerBaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.name.text = @"asdf";
    
    
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"主视图%ld",(long)indexPath.row);
    
    
    
    //    AudioServicesPlaySystemSound(1117);//1057，1103，1117
}






@end
