//
//  ReadMeTitleChange.h
//  GitHubApp
//
//  Created by Test on 2018/12/12.
//  Copyright © 2018 eillyer. All rights reserved.
//

#ifndef ReadMeTitleChange_h
#define ReadMeTitleChange_h
/*
 #import "HomeViewController.h"
 #import "top1.h"
 #import "top2.h"
 #import "top3.h"
 
 #import "SegmentTapView.h"
 #import "FlipTableView.h"
 
 @interface HomeViewController ()<SegmentTapViewDelegate,FlipTableViewDelegate>
 @property (nonatomic, strong)SegmentTapView *segment;
 @property (nonatomic, strong)FlipTableView *flipView;
 @property (strong, nonatomic) NSMutableArray *controllsArray;
 @end
 
 @implementation HomeViewController
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 [self initSegment];
 [self initFlipTableView];
 }
 
 -(void)initSegment{
 //    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 40) withDataArray:[NSArray arrayWithObjects:@"first",@"second",@"third", nil] withFont:15];
 self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth/2, 40) withDataArray:@[@"订桌",@"点餐",@"上菜"] withFont:15 withSelectFont:20 lineSize:CGSizeMake(30, 4) isBorder:YES];
 self.segment.delegate = self;
 
 //    [self.view addSubview:self.segment];
 self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.segment];
 }
 -(void)initFlipTableView{
 if (!self.controllsArray) {
 self.controllsArray = [[NSMutableArray alloc] init];
 }
 
 
 top1 *v1 = [top1 new];
 top2 *v2 = [top2 new];
 top3 *v3 = [top3 new];
 
 [self.controllsArray addObject:v1];
 [self.controllsArray addObject:v2];
 [self.controllsArray addObject:v3];
 
 self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64) withArray:_controllsArray];
 self.flipView.delegate = self;
 [self.view addSubview:self.flipView];
 }
 #pragma mark -------- select Index
 -(void)selectedIndex:(NSInteger)index
 {
 NSLog(@"%ld",index);
 [self.flipView selectIndex:index];
 
 }
 -(void)scrollChangeToIndex:(NSInteger)index
 {
 NSLog(@"%ld",index);
 [self.segment selectIndex:index];
 }
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 
 
 @end
 
 */

#endif /* ReadMeTitleChange_h */
