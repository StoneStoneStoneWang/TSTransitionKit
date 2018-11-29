//
//  TSNavigationController+Transition.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationControllerTransitionImpl.h"
NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Transition) 

@property (nonatomic ,strong) UINavigationControllerTransitionImpl *__impl;

@end

NS_ASSUME_NONNULL_END
