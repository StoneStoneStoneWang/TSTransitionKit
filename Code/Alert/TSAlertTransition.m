//
//  TSAlertTransition.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSAlertTransition.h"

@interface TSAlertTransition()

@end

@implementation TSAlertTransition

- (instancetype)initWithType:(TSControllerTransitionType)transitionType Duration:(NSTimeInterval)duration {
    
    if (self = [super initWithType:transitionType Duration:duration]) {
        
    }
    return self;
}
- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    if ([from isKindOfClass:[UITabBarController class]]) {
        
        NSLog(@"UITabBarController");
        
        NSLog(@"%@",from.view.subviews);
    }
    
    UIView *fromView = from.view;
    
    UIView *toView = to.view;
    
    UIView *temp = [fromView snapshotViewAfterScreenUpdates:false];
    
    temp.frame = fromView.bounds;
    
    UIView *containerView = transitionContext.containerView;
    
    [containerView addSubview:temp];
    
    [containerView addSubview:toView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CGFloat h = CGRectGetHeight([UIScreen mainScreen].bounds);
    
    CGFloat w = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    toView.frame = CGRectMake(0, 0, w, h);
    
//    toView.alpha = 0;
    
    UIView *cover = [[UIView alloc] initWithFrame:toView.bounds];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.tag = 999;
    
    cover.alpha = 0;
    
    [temp insertSubview:cover atIndex:0];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:1 initialSpringVelocity:1.0f / 0.55f options:UIViewAnimationOptionCurveLinear animations:^{
        
        cover.alpha = self.opacityViewTargetOpacity;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:true];
    }];
}
- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext {
    
//    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *fromView = from.view;
    
//    UIView *toView = to.view;
    
    UIView *containerView = transitionContext.containerView;
    
//    NSLog(@"%@",containerView.subviews);
    
    UIView *temp = containerView.subviews[0];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *cover = [temp viewWithTag:999];
    
    cover.alpha = self.opacityViewTargetOpacity;
    
    [containerView addSubview:fromView];
    
    CGFloat h = CGRectGetHeight([UIScreen mainScreen].bounds);
    
    CGFloat w = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    fromView.frame = CGRectMake(0, 0, w, h);
    
//    [containerView addSubview:toView];
    
    [UIView animateWithDuration:duration animations:^{
        
        cover.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            [transitionContext completeTransition:true];
            
            [fromView removeFromSuperview];
            
            //        [toView removeFromSuperview];
            
            [temp removeFromSuperview];
        }
        
    }];
}
@end
