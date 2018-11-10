//
//  TSBaseViewController+TS_Transition.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"
#import "TSNaviAnimation.h"

typedef NS_ENUM(NSInteger ,TSPanResponseType) {
    
    TSPanResponseTypeDefault = 0, // 默认响应是左边100
    
    TSPanResponseTypeFull, // 默认响应是左边100
    
    TSPanResponseTypeCustom
};
@interface TSBaseViewController (TS_Transition) <UIGestureRecognizerDelegate ,TSBaseAnimationDelegate>

/**
 * UIPercentDrivenInteractiveTransition
 */
@property(nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;
// 由于 addchildvc 会使childvc也添加了pan所以 增加了这个函数 是否添加

@property(nonatomic, assign) TSPanResponseType panResponseType;

- (BOOL )isAddPan;

- (void)addPanGesture;

- (CGFloat )panResponseW;

- (void)pushEnded;

- (void)popEnded;

@end

