//
//  TSNavigationController+Transition.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNavigationController+Transition.h"
#import "TSNaviAnimation.h"
#import "TSBaseViewController+TS_Transition.h"
@implementation TSNavigationController (Transition)

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(TSBaseAnimation *) animationController
{
    return animationController.interactivePopTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(TSBaseViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    if (fromVC.interactivePopTransition != nil)
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc] initWithType:operation Duration:0.5];
        
        animation.interactivePopTransition = fromVC.interactivePopTransition;
        
        [animation setMDelegate:fromVC];
        
        return animation; //手势
    }
    else
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc]initWithType:operation Duration:0.5];
        
        [animation setMDelegate:fromVC];
        
        return animation;//非手势
    }
}

@end
