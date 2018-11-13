//
//  TSAlertDemoViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSAlertDemoViewController.h"

@interface TSAlertDemoViewController ()

@end

@implementation TSAlertDemoViewController


- (void)configOwnSubviews {
    [super configOwnSubviews];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [back setTitle:@"关闭" forState:UIControlStateNormal];
    
    [back setTitle:@"关闭" forState:UIControlStateHighlighted];
    
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [back setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    [self.contentView addSubview:back];
    
    back.frame = CGRectMake(100, 100, 100, 100);
    
    [back addTarget:self action:@selector(onBackClick) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)onBackClick {
    
    [self dismissViewControllerAnimated:true completion:nil];
    
}
@end
