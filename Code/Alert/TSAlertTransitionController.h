//
//  TSAlertTransitionController.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/8.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSBaseViewController.h"
#import "TSBaseTransition.h"
NS_ASSUME_NONNULL_BEGIN

// bug 存在的地方是 不要放到viewdidload present 放到viewwillappear 画或者viewdidappear里
//。这种方式 会阻碍视频播放等

@interface TSAlertTransitionContentConfig: NSObject

+ (instancetype)defaultConfig;

// 肯定是居中 所以只需要设置size
@property (nonatomic ,assign) CGSize contentView_Size;

@property (nonatomic ,assign) CGFloat contentView_CornerRadius;

@property (nonatomic ,assign) BOOL contentView_MaskToBounds;

@property (nonatomic ,assign) CGFloat opacityViewTargetOpacity;

@property (nonatomic ,assign) NSTimeInterval showDuration;

@property (nonatomic ,assign) NSTimeInterval dismissDuration;
@end

@interface TSAlertTransitionController :TSBaseViewController  <UIViewControllerTransitioningDelegate>

#pragma mark --- 请用present vc

+ (instancetype)alertTransition;

+ (instancetype)alertTransitionWithConfig:(TSAlertTransitionContentConfig *)config;

- (instancetype)initWithConfig:(TSAlertTransitionContentConfig *)config;

@property (nonatomic ,strong ,readonly) UIView *contentView;

@property (nonatomic ,strong ,readonly) TSAlertTransitionContentConfig *config;

// 消失的时候可能需要用到

- (void)setDimissBlock:(DismissCompletion )dismiss;

@end

NS_ASSUME_NONNULL_END
