//
//  TSNavigationController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNavigationController.h"

@interface TSNavigationController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation TSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = true;
    }
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return self.viewControllers.count > 1;
}

@end
