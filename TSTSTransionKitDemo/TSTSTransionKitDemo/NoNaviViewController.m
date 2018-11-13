//
//  NoNaviViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NoNaviViewController.h"
#import "HasNaviViewController.h"
#import "TSNaviBottomUpViewController.h"
#import "TSAlertTransitionController.h"
#import "TSAlertView.h"
#import "AppDelegate.h"
@implementation NoNaviViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:true];
}
- (void)configOwnSubviews {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn addTarget:self action:@selector(gotoHasNavi) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(50 , 50, 120, 40);
    
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    
}

- (void)configOwnProperties {
//    [super configOwnProperties];
    
    self.view.backgroundColor = [UIColor yellowColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

- (void)gotoHasNavi {

    
    HasNaviViewController *navi = [HasNaviViewController new];
    
    [self.navigationController pushViewController:navi animated:true];
//    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
//
//    [TSAlertView ts_showFromSuper:delegate.window];
    
//    TSAlertTransitionController *has = [TSAlertTransitionController alertTransition];
//
////    [self.navigationController pushViewController:has animated:true];
//
////    TSNaviBottomUpViewController *navi = [[TSNaviBottomUpViewController alloc] initWithRootViewController:has];
//
//    [self presentViewController:has animated:true completion:nil];
}
- (BOOL)ts_prefersNavigationBarHidden {
    
    return true;
}
- (BOOL)ts_prefersStatusBarHidden {
    
    return false;
}
- (BOOL)ts_prefersTabbarHidden {
    
    return false;
}

@end
