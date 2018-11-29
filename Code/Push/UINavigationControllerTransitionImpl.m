//
//  UINavigationControllerTransitionImpl.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/29.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UINavigationControllerTransitionImpl.h"
#import "TSNaviAnimation.h"
#import "UIViewController+TS_Transition.h"
@implementation UINavigationControllerTransitionImpl

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(TSBaseAnimation *) animationController
{
    return animationController.ts_interactivePopTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(id <TSViewControllerPushAnimationDelegate>)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    if (fromVC.ts_interactivePopTransition != nil)
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc] initWithType:operation Duration:0.3];
        
        animation.ts_interactivePopTransition = fromVC.ts_interactivePopTransition;
        
        [animation setDelegate:(UIViewController *)fromVC];
        
        return animation; //手势
    }
    else
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc]initWithType:operation Duration:0.6];
        
        [animation setDelegate:(UIViewController *)fromVC];
        
        return animation;//非手势
    }
}

@end
