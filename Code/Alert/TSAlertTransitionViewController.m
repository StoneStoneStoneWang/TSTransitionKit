//
//  TSAlertTransitionViewController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSAlertTransitionViewController.h"
#import "TSAlertDismissTransitioning.h"
#import "TSAlertPresentTransitioning.h"

@interface TSAlertTransitionViewController()<UIViewControllerTransitioningDelegate,TSAlertPresentTransitioningDelegate>

@property (nonatomic ,strong) TSAlertDismissTransitioning *dis;

@property (nonatomic ,strong) TSAlertPresentTransitioning *pre;

@end

@implementation TSAlertTransitionViewController

+ (instancetype)alertTransition {
    
    return [self new];
}

- (UIView *)contentView {
    
    if (!_contentView) {
        
        _contentView = [UIView new];
        
        _contentView.layer.cornerRadius = 5;
        
        _contentView.layer.masksToBounds = true;
        
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (TSAlertDismissTransitioning *)dis {
    
    if (!_dis) {
        
        _dis = [TSAlertDismissTransitioning new];
    }
    return _dis;
}

- (TSAlertPresentTransitioning *)pre {
    
    if (!_pre) {
        
        _pre = [TSAlertPresentTransitioning new];
    }
    return _pre;
}
- (void)addOwnSubviews {
    [super addOwnSubviews];
    
    [self.view addSubview:self.contentView];
}
- (void)configOwnSubviews {
    [super configOwnSubviews];
    
    CGFloat margin = 48;
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    
    if (CGRectIsNull(self.contentFrame)) {
        
        self.contentFrame = CGRectMake(margin, h / 2 - h / 3 / 2, w - margin * 2, h / 3);
    }
}

- (void)configOwnProperties {
    [super configOwnProperties];
    
    self.transitioningDelegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return self.dis;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    if (self.isCoverResponse) {
        
        self.pre.mDelegate = self;
    }
    return self.pre;
}

- (void)onCoverClick {
    
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
