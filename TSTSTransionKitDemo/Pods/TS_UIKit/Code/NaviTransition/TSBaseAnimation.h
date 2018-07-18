//
//  TSBaseAnimation.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TSBaseAnimation : NSObject<UIViewControllerAnimatedTransitioning>
// push or pop
@property(nonatomic,assign,readonly) UINavigationControllerOperation transitionType;

@property(nonatomic,strong,readwrite) UIPercentDrivenInteractiveTransition *interactivePopTransition;

/**
 *  主要构造方法
 *  @param  transitionType      动画类型 push or pop
 *  @param  duration            间隔时间
 */
- (instancetype)initWithType:(UINavigationControllerOperation)transitionType
                    Duration:(NSTimeInterval)duration;

#pragma mark - push pop方法，具体交给子类实现
- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext;

- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext;

// 如pop to some vc and pop toroot。请手动管理栈区
/**
 *  NSMutableArray<UIViewController *> *vcs = [NSMutableArray arrayWithArray:[[self.navigationController.viewControllers reverseObjectEnumerator] allObjects]];
 
 while ([[vcs reverseObjectEnumerator] allObjects].count > 2) {
 
         [vcs removeObjectAtIndex:1];
 }
 
 [self.navigationController setViewControllers:vcs animated:false];
 *  根据需求移除数组中对象
 */

- (void)pushEnded;

- (void)popEnded;

@end
