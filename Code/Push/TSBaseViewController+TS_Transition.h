//
//  TSBaseViewController+TS_Transition.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"
#import "TSNaviAnimation.h"
#import "TSNavigationController.h"
typedef NS_ENUM(NSInteger ,TSPanResponseType) {
    
    TSPanResponseTypeDefault = 0, // 默认响应是左边100
    
    TSPanResponseTypeFull, // 默认响应是左边100
    
    TSPanResponseTypeCustom
};

@protocol TSViewControllerPushAnimationDelegate <NSObject>

- (BOOL )ts_prefersNavigationBarHidden;

- (BOOL )ts_prefersStatusBarHidden;

- (BOOL )ts_prefersTabbarHidden;

@property(nonatomic, strong) UIPercentDrivenInteractiveTransition *ts_interactivePopTransition;

- (NSInteger )ts_naviChildViewControllersCount;

- (UITabBarController *)get_Ts_tabbarController;

- (TSNavigationController *)get_Ts_naviController;

- (UIView *)get_Ts_childView;

@end

@interface UIViewController (AnimationDelegate) <TSBaseAnimationDelegate>

/*
 push 结束的时候
 */
- (void)pushEnded;

/*
 pop 结束的时候
 */

- (void)popEnded;

/*
 push 终止的时候
 */

- (void)pushCancled;

/*
 pop 终止的时候
 */

- (void)popCancled;

@end


@interface TSBaseViewController (TS_Transition) <UIGestureRecognizerDelegate ,TSViewControllerPushAnimationDelegate>

// 由于 addchildvc 会使childvc也添加了pan所以 增加了这个函数 是否添加

@property(nonatomic, assign) TSPanResponseType panResponseType;

/*
 是否添加侧滑响应手势
 */
- (BOOL )isAddPopPan;

/*
 具体添加侧滑手势的方法
 */

- (void)addPopPanGesture;

/*
    侧滑退出时 响应的距离
 */
- (CGFloat )popPanResponseW;

/*
 通过画运行时替换的方法
 */

- (void)__ts__viewDidLoad;

/*
  导航是否隐藏
 */

- (BOOL )ts_prefersNavigationBarHidden;

/*
 状态是否隐藏。这个先弃用吧
 */
- (BOOL )ts_prefersStatusBarHidden;
/*
 tabbar是否隐藏
 */
- (BOOL )ts_prefersTabbarHidden;

// 获取导航childvc的数量
- (NSInteger)ts_naviChildViewControllersCount;

// 获取导航tabbar
- (UITabBarController *)get_Ts_tabbarController;
// 获取导航navi
- (TSNavigationController *)get_Ts_naviController;
// 获取导航self.view
- (UIView *)get_Ts_childView ;

/**
 * UIPercentDrivenInteractiveTransition
 */
@property(nonatomic, strong) UIPercentDrivenInteractiveTransition *ts_interactivePopTransition;

@end

