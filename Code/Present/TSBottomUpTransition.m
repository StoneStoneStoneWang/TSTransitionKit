//
//  TSActionSheetTransition.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBottomUpTransition.h"
#define COVER_TAG 9999
@implementation TSBottomUpTransition

- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *fromView = from.view;
    
    UIView *toView = to.view;
    
    UIView *temp = [fromView snapshotViewAfterScreenUpdates:false];
    
    temp.frame = fromView.bounds;
    
    from.view.hidden = true;
    
    UIView *containerView = transitionContext.containerView;
    
    [containerView addSubview:temp];
    
    UIView *cover = [UIView new];
    
    cover.tag = COVER_TAG;
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.alpha = 0.3;
    
    cover.frame = temp.bounds;
    
    [temp addSubview:cover];
    
    [containerView addSubview:toView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onCoverClick)];
    
    [cover addGestureRecognizer:tap];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CGFloat h = CGRectGetHeight([UIScreen mainScreen].bounds);
    
    CGFloat w = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    toView.frame = CGRectMake(0, h, w, h);

    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:1 initialSpringVelocity:1.0f / 0.55f options:UIViewAnimationOptionCurveLinear animations:^{
        
        toView.transform = CGAffineTransformMakeTranslation(0, -h/2);
        
        temp.transform = CGAffineTransformMakeScale(0.8, 0.8);
        
        cover.alpha = 0.3;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:true];
    }];
}

- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *fromView = from.view;
    
    UIView *toView = to.view;
    
    UIView *containerView = transitionContext.containerView;
    
    UIView *temp = containerView.subviews[0];
    
    UIView *cover = [temp viewWithTag:COVER_TAG];
    
    cover.alpha = 0.3;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        fromView.transform = CGAffineTransformIdentity;
        
        temp.transform = CGAffineTransformIdentity;
        
        cover.alpha = 0;
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:true];
        
        toView.hidden = false;
        
        [temp removeFromSuperview];
    }];
}
- (void)onCoverClick {
    
    
}
@end
