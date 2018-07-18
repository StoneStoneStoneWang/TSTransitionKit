//
//  TSAlertTransitionViewController.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSBaseViewController.h"

//typedef void(^TSALertAction)(void);

@interface TSAlertTransitionViewController : TSBaseViewController

+ (instancetype)alertTransition;

@property (nonatomic ,strong) UIView *contentView;

@property (nonatomic ,assign) CGRect contentFrame;

@property (nonatomic ,getter=isCoverResponse) BOOL coverResponse;

@end
