//
//  TSNaviAnimationConfig.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNaviAnimationConfig.h"
#define KISIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))
@implementation TSNaviAnimationConfig

- (CGRect)statusBarFrame {
    
    if ([self prefersNavigationBarHidden]) {
        
        return CGRectZero;
    }
    
    return CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), KISIphoneX ? 44 : 20);
}

- (CGRect)naviFrame {
    
    if ([self prefersNavigationBarHidden]) {
        
        return CGRectZero;
    }
    
    return CGRectMake(0, KISIphoneX ? 44 : 20, CGRectGetWidth([UIScreen mainScreen].bounds), 44);
}

- (CGRect)tabbarFrame {
    
    if ([self prefersTabbarHidden]) {
        
        return CGRectZero;
    }
    
    return CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds) - (KISIphoneX ? 83 : 49), CGRectGetWidth([UIScreen mainScreen].bounds), (KISIphoneX ? 83 : 49));
}

@end
