//
//  UIViewController+AnimationTransitioningSnapshot.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+AnimationTransitioningSnapshot.h"
#import <objc/runtime.h>
@implementation UIViewController (AnimationTransitioningSnapshot)

- (UIView *)snapshot
{
    UIView *view = objc_getAssociatedObject(self, @"AnimationTransitioningSnapshot");
    if (!view)
    {
        view = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
        [self setSnapshot:view];
    }
    return view;
}

- (void)setSnapshot:(UIView *)snapshot
{
    objc_setAssociatedObject(self, @"AnimationTransitioningSnapshot", snapshot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)tabbarSnapshot {
    
    UIView *view = objc_getAssociatedObject(self, @"AnimationTransitioningSnapshot_tab");
    if (!view)
    {
        view = [self.tabBarController.view snapshotViewAfterScreenUpdates:NO];
        
        [self setTabbarSnapshot:view];
    }
    return view;
}
- (void)setTabbarSnapshot:(UIView *)tabbarSnapshot {
    
    objc_setAssociatedObject(self, @"AnimationTransitioningSnapshot_tab", tabbarSnapshot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)topSnapshot
{
    UIView *view = objc_getAssociatedObject(self, @"AnimationTransitioningTopSnapshot");
    if(!view)
    {
        view = [self.navigationController.view resizableSnapshotViewFromRect:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 64) afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
        
        [self setTopSnapshot:view];
    }
    return view;
}
- (void)setTopSnapshot:(UIView *)topSnapshot
{
    objc_setAssociatedObject(self, @"AnimationTransitioningTopSnapshot", topSnapshot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIView *)viewSnapshot
{
    UIView *view = objc_getAssociatedObject(self, @"AnimationTransitioningViewSnapshot");
    if (!view)
    {
        view = [self.navigationController.view resizableSnapshotViewFromRect:CGRectMake(0, 64, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds]) - 64) afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
        [self setViewSnapshot:view];
    }
    return view;
}

- (void)setViewSnapshot:(UIView *)viewSnapshot
{
    objc_setAssociatedObject(self, @"AnimationTransitioningViewSnapshot", viewSnapshot, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
