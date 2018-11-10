//
//  TSBaseTransionViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseTransitionViewController.h"

@interface TSBaseTransitionViewController () <TSBaseTransitionDelegate>

@property (nonatomic ,copy) DismissCompletion dis;

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
    
    TSBaseTransition *tr = [[TSBaseTransition alloc] initWithType:(TSControllerTransitionTypeDismiss) Duration:0.3];
    
    tr.mDelegate = self;
    
    return tr;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    TSBaseTransition *tr = [[TSBaseTransition alloc] initWithType:(TSControllerTransitionTypePresent) Duration:0.5];
    
    tr.mDelegate = self;
    
    return tr;
}

- (void)presentEnd {
    
    
}
- (void)dismissEnded {
    
    if (self.dis) {
        
        self.dis();
    }
}

- (void)setDimissBlock:(DismissCompletion)dismiss {
    
    self.dis = dismiss;
}

@end
