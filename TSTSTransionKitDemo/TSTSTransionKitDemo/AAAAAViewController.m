//
//  AAAAAViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "AAAAAViewController.h"
#import "HasNaviViewController.h"
@interface AAAAAViewController ()

@end

@implementation AAAAAViewController

- (BOOL)ts_prefersTabbarHidden {
    
    return true;
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
@end
