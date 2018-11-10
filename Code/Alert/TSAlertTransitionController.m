//
//  TSAlertTransitionController.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/8.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSAlertTransitionController.h"
#import "TSAlertTransition.h"

@implementation TSAlertTransitionContentConfig

+ (instancetype)defaultConfig {
    
    return [self new];
}
- (instancetype)init {
    
    if (self = [super init]) {
        
        self.contentView_MaskToBounds = false;
        
        self.contentView_CornerRadius = 5;
        
        self.contentView_Size = CGSizeMake(300, 300);
        
        self.showDuration = 0.5f;
        
        self.dismissDuration = 0.3f;
        
        self.opacityViewTargetOpacity = 0.3;
    }
    return self;
}
@end
@interface TSAlertTransitionController () <TSBaseTransitionDelegate>

@property (nonatomic ,strong ,readwrite) UIView *contentView;

@property (nonatomic ,strong ,readwrite) TSAlertTransitionContentConfig *config;

@property (nonatomic ,copy) DismissCompletion dis;
@end

@implementation TSAlertTransitionController

+ (instancetype)alertTransition {
    
    return [[self alloc] initWithConfig: [TSAlertTransitionContentConfig defaultConfig]];
}
+ (instancetype)alertTransitionWithConfig:(TSAlertTransitionContentConfig *)config {
    
    return [[self alloc] initWithConfig: config];
}

- (instancetype)initWithConfig:(TSAlertTransitionContentConfig *)config {
    
    if (self = [super init]) {
        
        _config = config;
    }
    return self;
}

- (UIView *)contentView {
    
    if (!_contentView) {
        
        _contentView = [UIView new];
        
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self addAnimation];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self removeAnimation];
}
- (void)addOwnSubviews {
    
    [self.view addSubview:self.contentView];
}

- (void)configOwnProperties {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.transitioningDelegate = self;
}

- (void)configOwnSubviews {
    
    self.contentView.frame = CGRectMake(0, 0, self.config.contentView_Size.width, self.config.contentView_Size.height);
    
    self.contentView.center = self.view.center;
    
    self.contentView.layer.cornerRadius = self.config.contentView_CornerRadius;
    
    self.contentView.layer.masksToBounds = self.config.contentView_MaskToBounds;
}

- (void)setDimissBlock:(DismissCompletion)dismiss {
    
    self.dis = dismiss;
}

#pragma mark --- addAnimation

- (void)addAnimation {
    
    NSMutableArray *values = [NSMutableArray arrayWithArray:@[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01, 0.01, 0.01)],
                                                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.01, 1.01, 1.01)],
                                                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.99, 0.99, 0.99)],
                                                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]]];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = self.config.showDuration;
    
    animation.removedOnCompletion = true;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.values = values;
    
    animation.keyTimes = @[@(0),@(0.5),@(0.75),@(1)];
    
    animation.timingFunctions = @[ [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] ];
    
    [self.contentView.layer addAnimation:animation forKey:@"transform"];
}
#pragma mark --- removeAnimation
- (void)removeAnimation {
    
    NSMutableArray *values = [NSMutableArray arrayWithArray:@[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.01, 1.01, 1.01)],
                                                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.99, 0.99, 0.99)],
                                                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)]]];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = self.config.dismissDuration;
    
    animation.removedOnCompletion = false;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.values = values;
    
    animation.keyTimes = @[@(0),@(0.25),@(1)];
    
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] ];
    
    [self.contentView.layer addAnimation:animation forKey:@"transform1"];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    TSAlertTransition *alertTransition = [[TSAlertTransition alloc] initWithType:(TSControllerTransitionTypeDismiss) Duration:self.config.dismissDuration];
    
    alertTransition.opacityViewTargetOpacity = self.config.opacityViewTargetOpacity;
    
    alertTransition.mDelegate = self;
    
    return alertTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    TSAlertTransition *tr = [[TSAlertTransition alloc] initWithType:(TSControllerTransitionTypePresent) Duration:self.config.showDuration];
    
    tr.opacityViewTargetOpacity = self.config.opacityViewTargetOpacity;
    
    tr.mDelegate = self;
    
    return tr;
}

- (void)presentEnd {
    
    
}
- (void)dismissEnded {
    
    if (self.dis) {
        
        self.dis();
    }
}

@end
