//
//  TSViewControllerPushAnimationDelegate.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UINavigationController+Transition.h"
@class TSNaviAnimationConfig;
NS_ASSUME_NONNULL_BEGIN

@protocol TSViewControllerPushAnimationDelegate <NSObject>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *ts_interactivePopTransition;

@property (nonatomic ,strong) TSNaviAnimationConfig *__config;

- (BOOL )ts_prefersNavigationBarHidden;

- (BOOL )ts_prefersTabbarHidden;

- (UITabBarController *)get_Ts_tabbarController;

- (UINavigationController *)get_Ts_naviController;

- (UIView *)get_Ts_childView;

@end

NS_ASSUME_NONNULL_END
