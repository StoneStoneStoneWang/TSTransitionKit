//
//  TSAlertPresentTransitioning.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class TSAlertPresentTransitioning;

@protocol TSAlertPresentTransitioningDelegate <NSObject>

- (void)onCoverClick;

@end

@interface TSAlertPresentTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

- (CGFloat )coverAlpha;

@property (nonatomic ,weak) id<TSAlertPresentTransitioningDelegate> mDelegate;
@end
