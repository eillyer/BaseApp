//
//  EillyerBaseTableViewViewController.h
//  GitHubApp
//
//  Created by eillyer on 2018/10/24.
//  Copyright © 2018年 eillyer. All rights reserved.
//

#import "EillyerBaseViewController.h"
#import "MJRefresh.h"
#import "EillyerTableCell.h"

@interface EillyerBaseTableViewViewController : EillyerBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

/**
 list数据
 */
@property (nonatomic,strong)NSMutableArray *arr;

/**
 请求数据用到
 */
@property (nonatomic,assign)NSInteger       page;

/**
 是否隐藏mj_header，下拉刷新，默认显示，即NO
 */
@property (nonatomic,assign)BOOL            isHiden_mj_header;

/**
 是否隐藏mj_footer，上拉加载更多，默认显示，即NO
 */
@property (nonatomic,assign)BOOL            isHiden_mj_footer;

/**
 结束刷新
 */
- (void)endRefreshing;

/**
 子类实现
 */
- (void)loadData;

/**
 显示 Or 隐藏 空数据View
 */
- (void)showOrHidenEmptyView;
@end
