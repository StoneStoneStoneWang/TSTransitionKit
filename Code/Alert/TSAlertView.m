//
//  TSAlertView.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSAlertView.h"

@implementation TSAlertViewConfig

+ (instancetype)defaultConfig {
    
    return [self new];
}
- (instancetype)init {
    
    if (self = [super init]) {
        
        self.contentView_MaskToBounds = false;
        
        self.contentView_CornerRadius = 5;
        
        self.contentView_Size = CGSizeMake(300, 300);
        
        self.isOpacityViewResponse = true;
        
        self.showDuration = 0.5f;
        
        self.dismissDuration = 0.3f;
        
        self.opacityViewTargetOpacity = 0.3;
    }
    return self;
}
@end

@interface TSAlertView ()

@property (nonatomic ,strong ) UIView *contentView;

@property (nonatomic ,strong ) UIView *opacityView;

@property (nonatomic ,strong ) TSAlertViewConfig *config;

- (instancetype)initWithConfig:( TSAlertViewConfig *)config;
@end

@implementation TSAlertView

- (UIView *)contentView {
    
    if (!_contentView) {
        
        _contentView = [UIView new];
        
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
- (UIView *)opacityView {
    
    if (!_opacityView) {
        
        _opacityView = [UIView new];
        
        _opacityView.backgroundColor = [UIColor blackColor];
    }
    return _opacityView;
}

+ (void)ts_showFromSuper:(UIView *)superView {
    
    return [self ts_showFromSuper:superView andConfig:[TSAlertViewConfig new]];
}

+ (void)ts_showFromSuper:(UIView *)superView andConfig:( TSAlertViewConfig *)config {
    
    TSAlertView *alert = [[TSAlertView alloc] initWithConfig:config];
    
    [superView addSubview:alert];
    
    alert.frame = superView.bounds;
    
    [alert show];
}


- (instancetype)initWithConfig:( TSAlertViewConfig *)config {
    
    if (self = [super initWithFrame:CGRectZero]) {
        
        if (config) {
            
            self.config = config;
        } else {
            
            self.config = [TSAlertViewConfig new];
        }
        
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    
    [self addSubview:self.opacityView];
    
    [self addSubview:self.contentView];
    
    self.contentView.layer.cornerRadius = self.config.contentView_CornerRadius;
    
    self.contentView.layer.masksToBounds = self.config.contentView_MaskToBounds;
    
    if (self.config.isOpacityViewResponse) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGr)];
        
        [self.opacityView addGestureRecognizer:tap];
    }
}

- (void)tapGr {
    
    [self dismiss];
}
- (void)show {
    
    [self addAnimation];
}

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
    
    [self.contentView.layer addAnimation:animation forKey:@"animation"];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    opacityAnimation.duration = self.config.showDuration;
    
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    opacityAnimation.removedOnCompletion = true;
    
    opacityAnimation.fromValue = @(0);
    
    opacityAnimation.toValue = @(self.config.opacityViewTargetOpacity);
    
    [self.opacityView.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    self.opacityView.alpha = 0.0;
    
    [UIView animateWithDuration:self.config.dismissDuration animations:^{
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            self.opacityView.alpha = self.config.opacityViewTargetOpacity;
        }
    }];
}

- (void)dismiss {
    
    [self removeAnimation];
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
    
    [self.contentView.layer addAnimation:animation forKey:@"animation"];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    opacityAnimation.duration = self.config.dismissDuration;
    
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    opacityAnimation.removedOnCompletion = false;
    
    opacityAnimation.fromValue = @(self.config.opacityViewTargetOpacity);
    
    opacityAnimation.toValue = @(0);
    
    [self.opacityView.layer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    
    self.opacityView.alpha = self.config.opacityViewTargetOpacity;
    
    [UIView animateWithDuration:self.config.dismissDuration animations:^{
        
        self.opacityView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            [self removeFromSuperview];
        }
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(0, 0, self.config.contentView_Size.width, self.config.contentView_Size.height);
    
    self.contentView.center = self.center;
    
    self.opacityView.frame = self.bounds;
}

@end
