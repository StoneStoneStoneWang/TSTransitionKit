//
//  TSBaseViewController.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Call.h"
#import "UIViewController+Orientation.h"
#import "UIViewController+StatusBar.h"

@interface TSBaseViewController : UIViewController

#pragma mark --- 添加子视图
- (void)addOwnSubviews;

#pragma mark --- 配置子视图

- (void)configOwnSubviews;

#pragma mark --- 配置导航
- (void)configNaviItem;

#pragma mark --- 配置属性
- (void)configOwnProperties;

#pragma mark --- 添加子vc
- (void)addOwnSubVC;

#pragma mark --- 准备数据

- (void)prepareData;


@end
