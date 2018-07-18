//
//  TSBaseTableViewCell.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSBaseTableBean.h"


@interface TSBaseTableViewCell : UITableViewCell

#pragma mark --- 初始化

+ (instancetype)instance:(BottomLineType ) bottomLineType withReuseId:(NSString *)iden;

- (instancetype)initWith:(BottomLineType)bottomLineType withReuseId:(NSString *)iden;

@property (nonatomic ,assign) BottomLineType bottomLineType;

//@property (nonatomic ,strong) NSIndexPath *indexPath;  // 弃用
- (void)updateViewData:(TSBaseTableBean *)data;

- (void)commitInit;
@end
