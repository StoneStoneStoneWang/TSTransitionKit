//
//  TSBaseTableView.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSBaseTableBean.h"
@class TSBaseTableView;

@protocol TSBaseTableViewDelegate<NSObject>

- (void)onTableView:(TSBaseTableView *)tableView forIndexPath:(NSIndexPath *)indexPath withData:(TSBaseTableBean *)data;

@optional
- (void)onScrollViewScroll:(TSBaseTableView *)tableView;

@end

@interface TSBaseTableView : UITableView <UITableViewDelegate,UITableViewDataSource>
// 不悬浮 属性
@property (nonatomic ,assign) CGFloat maxSectionHeader;

#pragma mark --- 自定义delegate
@property (nonatomic ,weak) id<TSBaseTableViewDelegate> mDelegate;

#pragma mark --- 数据源
@property (nonatomic ,strong ,readonly) NSMutableArray <TSBaseTableBean *>*ts_dataArray;

+ (instancetype)getInstance_t;

- (void)commitInit;

- (void)prepareData;

#pragma mark --- 更新 头部 脚部
- (void)updateHeader:(id)data;

- (void)updateFooter:(id)data;

#pragma mark --- 增删改查

- (void)updateData:(NSArray <TSBaseTableBean *>*)data;

- (void)appendData:(NSArray <TSBaseTableBean *>*)data;

- (void)updateData:(TSBaseTableBean *)data forIndexPath:(NSIndexPath *)indexPath;

- (void)insertData:(TSBaseTableBean *)data forIndexPath:(NSIndexPath *)indexPath;

- (void)deleteData:(TSBaseTableBean *)data forIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic ,assign ,readonly) NSInteger dataCount;

- (NSArray <TSBaseTableBean *>*)queryAllData;

- (TSBaseTableBean *)queryDataFor:(NSIndexPath *)indexPath;

- (TSBaseTableBean *)queryDataForIdx:(NSInteger )idx;

- (NSArray <TSBaseTableBean *>*)querySetFor:(NSArray <NSIndexPath *>*)set;

- (NSArray <TSBaseTableBean *>*)queryDataForIdxs:(NSArray *)idxs;

- (NSIndexPath *)queryDataForIndexPath:(TSBaseTableBean *)data;
@end
