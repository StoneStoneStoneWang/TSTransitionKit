//
//  TSBaseAnimation.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseAnimation.h"

@interface TSBaseAnimation ()

@property(nonatomic, assign) NSTimeInterval duration;

@property(nonatomic, assign, readwrite) UINavigationControllerOperation transitionType;

@property(nonatomic ,strong ,readwrite) id<UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic ,weak) id<TSBaseAnimationDelegate> mDelegate;

@end
@implementation TSBaseAnimation

- (instancetype)initWithType:(UINavigationControllerOperation)transitionType Duration:(NSTimeInterval)duration {
    
    if (self = [super init]) {
        
        self.duration       = duration;
        
        self.transitionType = transitionType;
    }
    return self;
}

- (void)setDelegate:(id<TSBaseAnimationDelegate>)mDelegate {
    
    self.mDelegate = mDelegate;
}
- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext{}
- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext{}

- (void)pushEnded{
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(pushEnded)]) {
        
        [_mDelegate pushEnded];
    }
}
- (void)popEnded{
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(popEnded)]) {
        
        [_mDelegate popEnded];
    }
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return self.duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    if (self.transitionType == UINavigationControllerOperationPush) {
        
        [self push:transitionContext];
        
    } else if (self.transitionType == UINavigationControllerOperationPop) {
        
        [self pop:transitionContext];
    }
}

- (void)animationEnded:(BOOL)transitionCompleted {
    
    if (!transitionCompleted) {
        
        if (self.transitionType == UINavigationControllerOperationPush) {
            
            [self pushCancled];
            
        } else if (self.transitionType == UINavigationControllerOperationPop) {
            
            [self popCancled];
        }
        
        return;
    }
    
    if (self.transitionType == UINavigationControllerOperationPush) {
        
        [self pushEnded];
        
    } else if (self.transitionType == UINavigationControllerOperationPop) {
        
        [self popEnded];
    }
}
- (void)popCancled {
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(popCancled)]) {
        
        [_mDelegate popCancled];
    }
}

- (void)pushCancled {
    
    if (_mDelegate && [_mDelegate respondsToSelector:@selector(pushCancled)]) {
        
        [_mDelegate pushCancled];
    }
}

@end
