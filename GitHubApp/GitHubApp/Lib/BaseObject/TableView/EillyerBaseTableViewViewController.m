//
//  EillyerBaseTableViewViewController.m
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "EillyerBaseTableViewViewController.h"

static NSString *tempCellIdentifier = @"EillyerTableCell";


@interface EillyerBaseTableViewViewController ()
@property (nonatomic,strong) UIView * emptyView;

@end

@implementation EillyerBaseTableViewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-SafeAreaBottomHeight-SafeAreaTopHeight) style:UITableViewStyleGrouped];
    _tableView = tableView;
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:NSClassFromString(@"EillyerTableCell") forCellReuseIdentifier:tempCellIdentifier];
    
    __weak typeof(self) weakSelf = self;
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadDataIsRefresh:YES];
    }];
    tableView.mj_footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        [weakSelf loadDataIsRefresh:NO];
    }];
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }

    
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
    if (_tableView.mj_header.isRefreshing) {
        [_tableView.mj_header endRefreshing];
    }
    if (_tableView.mj_footer.isRefreshing) {
        [_tableView.mj_footer endRefreshing];
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
        _tableView.mj_footer = nil;
    }
}

- (void)setIsHiden_mj_header:(BOOL)isHiden_mj_header{
    _isHiden_mj_header = isHiden_mj_header;
    if (isHiden_mj_header) {
        _tableView.mj_header = nil;
    }
}

- (void)loadDataIsRefresh:(BOOL)isRefresh{
    if (isRefresh) {
        _arr = [NSMutableArray array];
        [_tableView.mj_footer resetNoMoreData];
        _page = 0;
    }else{
        _page++;
    }
    [self loadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EillyerTableCell *cell = [tableView dequeueReusableCellWithIdentifier:tempCellIdentifier];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
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
