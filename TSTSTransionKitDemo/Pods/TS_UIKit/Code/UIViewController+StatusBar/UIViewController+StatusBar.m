//
//  UIViewController+StatusBar.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+StatusBar.h"

@implementation UIViewController (StatusBar)

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}
- (BOOL)prefersStatusBarHidden {
    
    return false;
}

@end
