//
//  TSAlertView.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TSAlertViewConfig: NSObject

+ (instancetype)defaultConfig;

// 肯定是居中 所以只需要设置size
@property (nonatomic ,assign) CGSize contentView_Size;

@property (nonatomic ,assign) CGFloat contentView_CornerRadius;

@property (nonatomic ,assign) BOOL contentView_MaskToBounds;

@property (nonatomic ,assign) BOOL isOpacityViewResponse;

@property (nonatomic ,assign) CGFloat opacityViewTargetOpacity;

@property (nonatomic ,assign) NSTimeInterval showDuration;

@property (nonatomic ,assign) NSTimeInterval dismissDuration;

@end

@interface TSAlertView : UIView

// 如果想覆盖整个手机屏 请传入 window
+ (void)ts_showFromSuper:(UIView *)superView;

+ (void)ts_showFromSuper:(UIView *)superView andConfig:(TSAlertViewConfig *)config;

#pragma mark --- show

- (void)show;

#pragma mark --- dismiss

- (void)dismiss;

@end

NS_ASSUME_NONNULL_END
