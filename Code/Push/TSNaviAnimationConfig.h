//
//  TSNaviAnimationConfig.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TSViewControllerPushAnimationDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface TSNaviAnimationConfig : NSObject
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
 tabbar 是否隐藏
 */
@property (nonatomic ,assign) BOOL prefersTabbarHidden;

@end

NS_ASSUME_NONNULL_END
