//
//  NoNaviViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "NoNaviViewController.h"
#import "HasNaviViewController.h"
@interface NoNaviViewController ()

@end

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
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}

- (void)gotoHasNavi {

    HasNaviViewController *has = [HasNaviViewController new];
    
    [self presentViewController:has animated:true completion:nil];
}

@end
