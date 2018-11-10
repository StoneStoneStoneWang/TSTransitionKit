//
//  TSBaseTransionViewController.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/7/18.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSBaseViewController.h"
#import "TSBaseTransition.h"

@interface TSBaseTransitionViewController : TSBaseViewController <UIViewControllerTransitioningDelegate>

// 消失的时候可能需要用到
- (void)setDimissBlock:(DismissCompletion )dismiss;

@end
