//
//  HasNaviViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "HasNaviViewController.h"
#import "TSBottomUpTransition.h"
#import "TSNavigationController+Transition.h"
#import "TSAlertTransition.h"

@interface HasNaviViewController ()

@end

@implementation HasNaviViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:false];
}
- (void)configOwnSubviews {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(50 , 100, 120, 40);
    
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn1 addTarget:self action:@selector(goPush) forControlEvents:UIControlEventTouchUpInside];
    
    btn1.frame = CGRectMake(50 , 150, 120, 40);
    
    [btn1 setTitle:@"跳转" forState:UIControlStateNormal];
    
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn1];
}
- (void)goPush {
    
    HasNaviViewController *has = [HasNaviViewController new];
    
    [self.navigationController pushViewController:has animated:true];
}
- (void)configOwnProperties {
    [super configOwnProperties];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)goBack {
    
//    [self.navigationController popViewControllerAnimated:true];
    [self dismissViewControllerAnimated:true completion:nil];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[TSAlertTransition alloc] initWithType:(TSControllerTransitionTypeDismiss) Duration:0.3];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    TSAlertTransition *tr = [[TSAlertTransition alloc] initWithType:(TSControllerTransitionTypePresent) Duration:0.3];
    
    //    tr.
    
    return tr;
}

@end
