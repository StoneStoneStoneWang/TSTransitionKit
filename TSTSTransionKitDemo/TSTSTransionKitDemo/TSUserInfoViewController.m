//
//  TSUserInfoViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSUserInfoViewController.h"
#import "TSBaseViewController+TS_Transition.h"
@interface TSUserInfoViewController ()

@end

@implementation TSUserInfoViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self get_Ts_naviController] setNavigationBarHidden:false];
}

- (BOOL)ts_prefersNavigationBarHidden {
    
    return false;
}

- (void)configNaviItem {
    
    self.title = @"设置标题";
}

@end
