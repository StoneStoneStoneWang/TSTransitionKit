//
//  TSBaseTransition.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseTransition.h"
@interface TSBaseTransition()

@property (nonatomic , assign, readwrite) TSControllerTransitionType transitionType;

@property(nonatomic, assign) NSTimeInterval duration;
@end

@implementation TSBaseTransition

- (instancetype)initWithType:(TSControllerTransitionType)transitionType Duration:(NSTimeInterval)duration {
    
    if (self = [super init]) {
        
        self.duration = duration;
        
        self.transitionType = transitionType;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return self.duration;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    if (self.transitionType == TSControllerTransitionTypePresent) {
        
        [self present:transitionContext];
    } else if (self.transitionType == TSControllerTransitionTypeDismiss){
        
        [self dismiss:transitionContext];
    }
}
- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext {}

- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext {}

- (void)presentEnd {}

- (void)dismissEnded {}
@end
