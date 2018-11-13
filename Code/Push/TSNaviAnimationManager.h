//
//  TSNaviAnimationManager.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TSBaseViewController+TS_Transition.h"
NS_ASSUME_NONNULL_BEGIN

// 手动管理栈区 根据vc的navi的childvcs  我这里记录的是来的时候的导航和tabbar 是什么样的 回去的时候就是什么样的
@interface TSNaviAnimationConfig: NSObject
/**
 状态栏 样式
 */
@property (nonatomic ,assign) UIBarStyle statusStyle;
/**
 状态栏 tint color
 */
@property (nonatomic ,strong) UIColor *statusTintColor;

/**
 状态栏frame
 */

@property (nonatomic ,assign) CGRect statusBarFrame;
/**
 状态栏frame
 */
@property (nonatomic ,strong) UIImage *naviImage;
/**
 状态栏frame
 */
@property (nonatomic ,assign) CGRect naviFrame;
/**
 状态栏frame
 */
@property (nonatomic ,strong) UIImage *tabbarImage;
/**
 状态栏frame
 */
@property (nonatomic ,assign) CGRect tabbarFrame;
/**
 导航是否隐藏
 */
@property (nonatomic ,assign) BOOL prefersNavigationBarHidden;
/**
 状态栏是否隐藏
 */
@property (nonatomic ,assign) BOOL prefersStatusBarHidden;

/**
 tabbar 是否隐藏
 */
@property (nonatomic ,assign) BOOL prefersTabbarHidden;

/**
 tabbar 是否隐藏
 */

@property (nonatomic ,strong) id <TSViewControllerPushAnimationDelegate> vc;

@end

@interface TSNaviAnimationManager : NSObject

+ (instancetype)shared;

/**
 于vc栈区管理一样
 */
@property (nonatomic , strong, readonly) NSMutableArray <TSNaviAnimationConfig *>*viewControllersConfigs;
// 开始转场 这个函数的意思是 一级界面开始转场
- (void)startPushFrom:(id <TSViewControllerPushAnimationDelegate>)from;

// 结束专场 这个函数的意思是 回到一级界面

- (void)endPushTo:(id <TSViewControllerPushAnimationDelegate>)to;

- (void)startPopFrom:(id <TSViewControllerPushAnimationDelegate>)from;

- (void)endPopToWithFrom:(id <TSViewControllerPushAnimationDelegate>)from;

- (TSNaviAnimationConfig *)getCurrentConfigThrough:(id <TSViewControllerPushAnimationDelegate>)vc;

- (void)removeAll;

@end

NS_ASSUME_NONNULL_END
