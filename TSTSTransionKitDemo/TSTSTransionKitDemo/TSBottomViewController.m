//
//  TSBottomViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBottomViewController.h"
#import "TSBottomUpTransition.h"
@interface TSBottomViewController ()

@end

@implementation TSBottomViewController

- (void)configOwnSubviews {
    [super configOwnSubviews];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [back setTitle:@"选择完规格去购买" forState:UIControlStateNormal];
    
    [back setTitle:@"选择完规格去购买" forState:UIControlStateHighlighted];
    
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [back setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    [self.view addSubview:back];
    
    back.frame = CGRectMake(100, 100, 100, 100);
    
    [back addTarget:self action:@selector(onBuyItemClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)onBuyItemClick {
    
    [self dismissViewControllerAnimated:true completion:nil];
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

@end
