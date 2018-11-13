//
//  MainViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/29.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "MainViewController.h"
#import "TSMeViewController.h"
#import "TSHomeViewController.h"
#import "TSTransitionKit.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
        TSHomeViewController *video = [TSHomeViewController new];
    
        video.title = @"首页";
    
        video.tabBarItem.title = @"首页";
    
        TSNavigationController *navi1 = [[TSNavigationController alloc]initWithRootViewController:video];
    
        [self addChildViewController:navi1];
    
        TSMeViewController *me = [TSMeViewController new];
    
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
