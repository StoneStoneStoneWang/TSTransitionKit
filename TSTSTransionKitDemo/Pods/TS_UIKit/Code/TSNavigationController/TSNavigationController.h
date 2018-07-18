//
//  TSNavigationController.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSNavigationController : UINavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

+ (void)initialize;

@end
