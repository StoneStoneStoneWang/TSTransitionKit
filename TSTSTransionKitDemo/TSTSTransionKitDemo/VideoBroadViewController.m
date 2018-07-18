//
//  VideoBroadViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "VideoBroadViewController.h"

@interface VideoBroadViewController ()

@end

@implementation VideoBroadViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:true];
}
- (void)configOwnProperties {
    
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}
@end
