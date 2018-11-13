//
//  TSHomeViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSHomeViewController.h"
#import "TSBaseViewController+TS_Transition.h"
#import "TSUserInfoViewController.h"
#import "TSAlertDemoViewController.h"
#import "TSNaviBottomUpViewController.h"
#import "TSBottomViewController.h"
#import "TSOrderConfirmViewController.h"
@interface TSHomeViewController ()

@end

@implementation TSHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    [[self get_Ts_naviController] setNavigationBarHidden:false];
}

- (void)configOwnSubviews {
    [super configOwnSubviews];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(onBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    
    [btn setTitle:@"跳转" forState:UIControlStateHighlighted];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    btn.frame = CGRectMake(100, 100, 200, 100);
    
    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:alertBtn];
    
    [alertBtn addTarget:self action:@selector(onAlertBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [alertBtn setTitle:@"Alert" forState:UIControlStateNormal];
    
    [alertBtn setTitle:@"Alert" forState:UIControlStateHighlighted];
    
    [alertBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [alertBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    alertBtn.frame = CGRectMake(100, 200, 200, 100);
    
    UIButton *bottomUpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:bottomUpBtn];
    
    [bottomUpBtn addTarget:self action:@selector(onBBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [bottomUpBtn setTitle:@"模仿购买流程" forState:UIControlStateNormal];
    
    [bottomUpBtn setTitle:@"模仿购买流程" forState:UIControlStateHighlighted];
    
    [bottomUpBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [bottomUpBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    bottomUpBtn.frame = CGRectMake(100, 300, 200, 100);
    
    UIButton *naviBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:naviBtn];
    
    [naviBtn addTarget:self action:@selector(onNaviBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [naviBtn setTitle:@"推出含导航的" forState:UIControlStateNormal];
    
    [naviBtn setTitle:@"推出含导航的" forState:UIControlStateHighlighted];
    
    [naviBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [naviBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    naviBtn.frame = CGRectMake(100, 400, 200, 100);
}
- (void)onBtnClick {
    
    TSUserInfoViewController *userInfo = [TSUserInfoViewController new];
    
    [self.navigationController pushViewController:userInfo animated:true];
}
- (void)onAlertBtnClick {
    
    TSAlertDemoViewController *alert = [TSAlertDemoViewController alertTransition];
    
    [self presentViewController:alert animated:true completion:nil];
}
- (void)onNaviBtnClick {
    
    TSBottomViewController *alert = [TSBottomViewController new];
    
    [self presentViewController:[[TSNaviBottomUpViewController alloc] initWithRootViewController:alert] animated:true completion:nil];
}
- (void)onBBtnClick {
    
    TSBottomViewController *b = [TSBottomViewController new];
    
    b.delayTime = 0.3;
    
    [self presentViewController:b animated:true completion:nil];
    
    b.dis = ^{
        
        TSOrderConfirmViewController *order = [TSOrderConfirmViewController new];
        
        [self.navigationController pushViewController:order animated:true];
    };
}
- (BOOL)ts_prefersNavigationBarHidden {
    
    return false;
}
- (BOOL)ts_prefersTabbarHidden {
    
    return false;
}

@end
