//
//  TSBaseTransionViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseTransitionViewController.h"
#import "TSBaseTransition.h"
@interface TSBaseTransitionViewController ()

@end

@implementation TSBaseTransitionViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
}
- (void)configOwnProperties {
    [super configOwnProperties];
    
    
}
// 子类继承 重写这两个函数
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[TSBaseTransition alloc] initWithType:(TSControllerTransitionTypeDismiss) Duration:0.3];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[TSBaseTransition alloc] initWithType:(TSControllerTransitionTypePresent) Duration:0.5];
}
@end
