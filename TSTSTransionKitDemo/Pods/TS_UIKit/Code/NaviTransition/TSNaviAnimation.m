//
//  TSNaviAnimation.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNaviAnimation.h"
#import "TSBaseViewController.h"
#import "UIViewController+AnimationTransitioningSnapshot.h"

#define COVER_TAG 9999
@implementation TSNaviAnimation

- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromVc   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (fromVc.tabBarController) {
        
        [self pushWithTabbarSnapShot:transitionContext];
    } else {
        
        [self pushWithNaviSnapShot:transitionContext];
    }
}

- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromVc   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if (fromVc.tabBarController) {
        
        [self popWithTabbarSnapShot:transitionContext];
    } else {
        
        [self popWithNaviSnapShot:transitionContext];
    }
}

#pragma mark --- push with tabbar snapshot

- (void)pushWithTabbarSnapShot:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromVc   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController * toVc     = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSTimeInterval duration     = [self transitionDuration:transitionContext];
    
    CGRect bounds               = [[UIScreen mainScreen] bounds];
    
    fromVc.view.hidden          = YES;
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    [[toVc.navigationController.view superview] insertSubview: fromVc.tabbarSnapshot  belowSubview:toVc.navigationController.view];
    
    fromVc.tabBarController.tabBar.hidden = true;
    
    UIView *cover = [UIView new];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.frame = bounds;
    
    [[toVc.navigationController.view superview] insertSubview:cover belowSubview:toVc.navigationController.view];
    
    cover.alpha = 0;
    
    toVc.navigationController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0);
    
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:1.0
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         fromVc.tabbarSnapshot.transform = CGAffineTransformMakeScale(0.98, 0.98) ;
                         
                         cover.alpha = 0.3;
                         
                         toVc.navigationController.view.transform = CGAffineTransformMakeTranslation(0, 0);
                         
                     }
                     completion:^(BOOL finished) {
                         
                         fromVc.view.hidden = NO;
                         
                         [cover removeFromSuperview];
                         
                         [fromVc.tabbarSnapshot removeFromSuperview];
                         
                         [transitionContext completeTransition:YES];
                     }];
}

#pragma mark ---- push with navi snap shot

- (void)pushWithNaviSnapShot:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController * fromVc   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController * toVc     = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSTimeInterval duration     = [self transitionDuration:transitionContext];
    
    CGRect bounds               = [[UIScreen mainScreen] bounds];
    
    fromVc.view.hidden          = YES;
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    [[toVc.navigationController.view superview] insertSubview:fromVc.snapshot belowSubview:toVc.navigationController.view];
    
    UIView *cover = [UIView new];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.frame = bounds;
    
    [[toVc.navigationController.view superview] insertSubview:cover belowSubview:toVc.navigationController.view];
    
    cover.alpha = 0;
    
    toVc.navigationController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0);
    
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:1.0
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         fromVc.snapshot.transform = CGAffineTransformMakeScale(0.98, 0.98) ;
                         
                         cover.alpha = 0.3;
                         
                         toVc.navigationController.view.transform = CGAffineTransformMakeTranslation(0, 0);
                         
                     }
                     completion:^(BOOL finished) {
                         
                         fromVc.view.hidden = NO;
                         
                         [cover removeFromSuperview];
                         
                         [fromVc.snapshot removeFromSuperview];
                         
                         [transitionContext completeTransition:YES];
                     }];
}

#pragma mark ---- pop with tabbar snap shot

- (void)popWithTabbarSnapShot:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    TSBaseViewController * fromVc  = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController * toVc         = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSTimeInterval duration         = [self transitionDuration:transitionContext];
    
    CGRect bounds                   = [[UIScreen mainScreen] bounds];
    
    [fromVc.view addSubview:fromVc.tabbarSnapshot];
    
    fromVc.navigationController.navigationBar.hidden = YES;
    
    fromVc.view.transform = CGAffineTransformIdentity;
    
    toVc.view.hidden                = YES;
    
    toVc.tabBarController.tabBar.hidden = true;
    
    UIView *cover = [UIView new];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.frame = bounds;
    
    cover.alpha = 0.3;
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    [[transitionContext containerView] addSubview:toVc.tabbarSnapshot];
    
    [[transitionContext containerView] sendSubviewToBack:toVc.tabbarSnapshot];
    
    [toVc.tabbarSnapshot addSubview:cover];
    
    if (fromVc.interactivePopTransition)
    {
        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             fromVc.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
                             
                             toVc.tabbarSnapshot.transform = CGAffineTransformIdentity;
                             
                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             
                             toVc.navigationController.navigationBar.hidden = NO;
                             
                             toVc.view.hidden = NO;
                             
                             [fromVc.tabbarSnapshot removeFromSuperview] ;
                             
                             [toVc.tabbarSnapshot removeFromSuperview];
                             
                             [cover removeFromSuperview];
                             
                             fromVc.tabbarSnapshot = nil;
                             
                             if (![transitionContext transitionWasCancelled]) {
                                 
                                 toVc.tabbarSnapshot = nil;
                             }
                             
                             toVc.tabBarController.tabBar.hidden = false;
                             
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
        
    }
    else
    {
        [UIView animateWithDuration:duration
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             fromVc.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
                             
                             toVc.tabbarSnapshot.transform = CGAffineTransformIdentity;
                             
                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             
                             toVc.navigationController.navigationBar.hidden = NO;
                             toVc.view.hidden = NO;
                             
                             [fromVc.tabbarSnapshot removeFromSuperview];
                             
                             [toVc.tabbarSnapshot removeFromSuperview];
                             
                             [cover removeFromSuperview];
                             
                             fromVc.tabbarSnapshot = nil;
                             
                             if (![transitionContext transitionWasCancelled]) {
                                 
                                 toVc.tabbarSnapshot = nil;
                             }
                             
                             toVc.tabBarController.tabBar.hidden = false;
                             
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
    }
}

#pragma mark ---- pop with navi snap shot

- (void)popWithNaviSnapShot:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    TSBaseViewController * fromVc  = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController * toVc         = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    NSTimeInterval duration         = [self transitionDuration:transitionContext];
    
    CGRect bounds                   = [[UIScreen mainScreen] bounds];
    
    [fromVc.view addSubview:fromVc.snapshot];
    
    fromVc.navigationController.navigationBar.hidden = YES;
    
    fromVc.view.transform = CGAffineTransformIdentity;
    
    toVc.view.hidden                = YES;
    
    UIView *cover = [UIView new];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.frame = bounds;
    
    cover.alpha = 0.3;
    
    [[transitionContext containerView] addSubview:toVc.view];
    
    [[transitionContext containerView] addSubview:toVc.snapshot ];
    
    [[transitionContext containerView] sendSubviewToBack:toVc.snapshot ];
    
    [toVc.snapshot addSubview:cover];
    
    if (fromVc.interactivePopTransition)
    {
        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             fromVc.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
                             
                             toVc.snapshot.transform = CGAffineTransformIdentity;
                             
                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             
                             toVc.navigationController.navigationBar.hidden = NO;
                             
                             toVc.view.hidden = NO;
                             
                             [fromVc.snapshot removeFromSuperview];
                             
                             [toVc.snapshot removeFromSuperview] ;
                             
                             [cover removeFromSuperview];
                             
                             fromVc.snapshot = nil;
                             
                             if (![transitionContext transitionWasCancelled]) {
                                 
                                 toVc.snapshot = nil;
                             }
                             
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
        
    }
    else
    {
        [UIView animateWithDuration:duration
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             fromVc.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
                             
                             toVc.snapshot.transform = CGAffineTransformIdentity;
                             
                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             
                             toVc.navigationController.navigationBar.hidden = NO;
                             toVc.view.hidden = NO;
                             
                             [fromVc.snapshot removeFromSuperview];
                             
                             [toVc.snapshot removeFromSuperview] ;
                             
                             [cover removeFromSuperview];
                             
                             fromVc.snapshot = nil;
                             
                             if (![transitionContext transitionWasCancelled]) {
                                 
                                 toVc.snapshot = nil;
                             }
                             
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
    }
}
- (void)popEnded {
    
}
- (void)pushEnded {}


@end
