//
//  EillyerBaseCollectionView.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "EillyerBaseCollectionView.h"
static NSString *tempCellIdentifier = @"tempCellIdentifier";


@interface EillyerBaseCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UIView * emptyView;

@end

@implementation EillyerBaseCollectionView
- (void)viewDidLoad {
    [super viewDidLoad];
    
    EillyerBaseFlowLayout *flowLayout = [[EillyerBaseFlowLayout alloc] initWithCount:1 width:kScreenWidth height:kScreenHeight isH:YES];

    
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-SafeAreaBottomHeight-SafeAreaTopHeight) collectionViewLayout:flowLayout];
    [collectionView setCollectionViewLayout:flowLayout];
    collectionView.backgroundColor = kTableColor;
    _collectionView = collectionView;

    [self.view addSubview:collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;

    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:tempCellIdentifier];
    

    
    
    __weak typeof(self) weakSelf = self;
    collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadDataIsRefresh:YES];
    }];
    collectionView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataIsRefresh:NO];
    }];
    if (@available(iOS 11.0, *)) {
        collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    
    
//    HomeGoodsItemFlowLayout *flowLayout = [[HomeGoodsItemFlowLayout alloc] initWithCount:3 width:kScreenWidth-self.tableView.frame.size.width height:130 isH:YES];
//    [self.collectionView setCollectionViewLayout:flowLayout];

    
    
    UIView *EmptyView = [self addEmptyViewWithImage:[UIImage imageNamed:@"noData"] title:@"暂无数据"];
    EmptyView.hidden = YES;
    _emptyView = EmptyView;
    [self.view addSubview:EmptyView];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self loadDataIsRefresh:YES];
}

- (void)setArr:(NSMutableArray *)arr{
    _arr = arr;
}

- (void)endRefreshing{
    if (_collectionView.mj_header.isRefreshing) {
        [_collectionView.mj_header endRefreshing];
    }
    if (_collectionView.mj_footer.isRefreshing) {
        [_collectionView.mj_footer endRefreshing];
    }
}

//子类实现，数据加载
- (void)loadData{
    
}

- (void)showOrHidenEmptyView{
    if (!_arr.count) {
        _emptyView.hidden = NO;
    }else{
        _emptyView.hidden = YES;
    }
}

- (void)setIsHiden_mj_footer:(BOOL)isHiden_mj_footer{
    _isHiden_mj_footer = isHiden_mj_footer;
    if (isHiden_mj_footer) {
        _collectionView.mj_footer = nil;
    }
}

- (void)setIsHiden_mj_header:(BOOL)isHiden_mj_header{
    _isHiden_mj_header = isHiden_mj_header;
    if (isHiden_mj_header) {
        _collectionView.mj_header = nil;
    }
}

- (void)loadDataIsRefresh:(BOOL)isRefresh{
    if (isRefresh) {
        _arr = [NSMutableArray array];
        [_collectionView.mj_footer resetNoMoreData];
        _page = 0;
    }else{
        _page++;
    }
    [self loadData];
}


#pragma mark - CollectionView delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:tempCellIdentifier forIndexPath:indexPath];
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"主视图%ld",(long)indexPath.row);
    //    AudioServicesPlaySystemSound(1117);//1057，1103，1117
}

























- (UIView *)addEmptyViewWithImage:(UIImage *)image title:(NSString *) title {
    UIView *emptyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    [self.view addSubview:emptyView];
    CGFloat emptyImageVWidth = [UIScreen mainScreen].bounds.size.width/6;
    UIImageView *emptyImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, emptyImageVWidth, image.size.height/image.size.height*emptyImageVWidth)];
    [emptyView addSubview:emptyImageV];
    emptyImageV.image = image;
    CGRect emptyImageVFrame = emptyImageV.frame;
    emptyImageVFrame.origin.x = emptyView.frame.size.width/2 - emptyImageVWidth/2;
    emptyImageV.frame = emptyImageVFrame;
    
    UILabel *noticeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, emptyImageV.frame.size.height+8, emptyView.frame.size.width, 20)];
    [emptyView addSubview:noticeLabel];
    noticeLabel.text = title;
    noticeLabel.font = [UIFont systemFontOfSize:13];
    noticeLabel.textAlignment = NSTextAlignmentCenter;
    noticeLabel.textColor = [UIColor colorWithRed:177.0/255 green:177.0/255 blue:177.0/255 alpha:1];
    CGRect emptyViewFrame = emptyView.frame;
    
    emptyViewFrame.size.height = noticeLabel.frame.origin.y+noticeLabel.frame.size.height;
    emptyViewFrame.origin.y = [UIScreen mainScreen].bounds.size.height/2 - emptyViewFrame.size.height/2;
    
    
    emptyView.frame = emptyViewFrame;
    return emptyView;
}

@end
