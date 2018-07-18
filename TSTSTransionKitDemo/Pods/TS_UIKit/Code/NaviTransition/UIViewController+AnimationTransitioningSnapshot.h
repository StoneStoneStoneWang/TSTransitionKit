//
//  UIViewController+AnimationTransitioningSnapshot.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/2.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AnimationTransitioningSnapshot)

/**
 *屏幕快照
 */
@property (nonatomic, strong) UIView *snapshot;

@property(nonatomic,strong)UIView *topSnapshot;

@property(nonatomic,strong)UIView *viewSnapshot;

@property (nonatomic ,strong) UIView *tabbarSnapshot;

@end
