//
//  VideoViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoBroadViewController.h"
@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:false];
}

- (void)configOwnProperties {
//    [super configOwnProperties];
    
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)configOwnSubviews {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn addTarget:self action:@selector(gotoVideo) forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(50 , 100, 120, 40);
    
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
}

- (void)gotoVideo {
    
    VideoBroadViewController *broad = [VideoBroadViewController new];
    
    [self.navigationController pushViewController:broad animated:true];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}
@end
