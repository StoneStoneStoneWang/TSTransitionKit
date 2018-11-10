//
//  TSNaviTransitionViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNaviBottomUpViewController.h"
#import "TSBottomUpTransition.h"

@interface TSNaviBottomUpViewController () <TSBottomUpTransitionDelegate>

@property (nonatomic ,copy) DismissCompletion dis;

@end

@implementation TSNaviBottomUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    TSBottomUpTransition *tr = [[TSBottomUpTransition alloc] initWithType:(TSControllerTransitionTypeDismiss) Duration:0.3];
    
    tr.mDelegate = self;
    
    return tr;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    TSBottomUpTransition *tr = [[TSBottomUpTransition alloc] initWithType:(TSControllerTransitionTypePresent) Duration:0.5];
    
    tr.mDelegate = self;
    
    return tr;
}

// NSdecimalnumber

- (void)presentEnd {
    
    
}
- (void)dismissEnded {
    
    if (self.dis) {
        
        self.dis();
    }
}

- (void)onCoverClick {
    
    if (self.opacityCanResponse) {
        
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

- (void)setDimissBlock:(DismissCompletion)dismiss {
    
    self.dis = dismiss;
}
@end
