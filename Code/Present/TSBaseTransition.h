//
//  TSBaseTransition.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TSControllerTransitionType) {
    TSControllerTransitionTypeNone,
    TSControllerTransitionTypePresent,
    TSControllerTransitionTypeDismiss
};
@interface TSBaseTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic , assign, readonly) TSControllerTransitionType transitionType;

/**
 *  主要构造方法
 *  @param  transitionType      动画类型 present or dismiss
 *  @param  duration            间隔时间
 */
- (instancetype)initWithType:(TSControllerTransitionType) transitionType
                    Duration:(NSTimeInterval)duration;

#pragma mark - push pop方法，具体交给子类实现
- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext;

- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext;

- (void)presentEnd;

- (void)dismissEnded;

@end
