//
//  MainViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/29.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "MainViewController.h"
#import "NoNaviViewController.h"

#import "VideoViewController.h"

#import "TSNavigationController.h"
#import "TSNavigationController+Transition.h"

#import "TSAlertTransitionController.h"
@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    VideoViewController *video = [VideoViewController new];
    
    video.title = @"视频";
    
    video.tabBarItem.title = @"视频";
    
    TSNavigationController *navi1 = [[TSNavigationController alloc]initWithRootViewController:video];
    
    [self addChildViewController:navi1];
    
    NoNaviViewController *me = [NoNaviViewController new];
    
    me.title = @"我的";
    
    me.tabBarItem.title = @"我的";
    
    TSNavigationController *navi2 = [[TSNavigationController alloc]initWithRootViewController:me];
    
    [self addChildViewController:navi2];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
}
@end

// 我需要两种动画 第一种是没有导航展示的 跳转到有导航展示的
// 有导航的跳转到没导航的
