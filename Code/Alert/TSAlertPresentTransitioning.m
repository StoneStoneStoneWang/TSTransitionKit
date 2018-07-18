//
//  TSAlertPresentTransitioning.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSAlertPresentTransitioning.h"

@implementation TSAlertPresentTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.25;
}

- (CGFloat)coverAlpha {
    
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:false];
    
    tempView.frame = fromVC.view.frame;
    
    fromVC.view.hidden = true;
    
    UIView *containerView = [transitionContext containerView];
    
    UIView *cover = [[UIView alloc] initWithFrame: tempView.bounds];
    
    cover.alpha = 0;
    
    [tempView addSubview:cover];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onCoverClick)];
    
    [cover addGestureRecognizer:tap];
    
    [containerView addSubview:toVC.view];
    
    toVC.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    toVC.view.backgroundColor = [UIColor clearColor];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        cover.alpha = [self coverAlpha];
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:true];
        
    }];
}
- (void)onCoverClick {
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(onCoverClick)]) {
        
        [_mDelegate onCoverClick];
    }
}

@end
