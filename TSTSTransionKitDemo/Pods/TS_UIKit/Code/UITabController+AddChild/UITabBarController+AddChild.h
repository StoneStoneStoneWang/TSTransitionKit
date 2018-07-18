//
//  UITabBarController+AddChild.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (AddChild)

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title andTabTitle:(NSString *)tabTitle andNormalImage:(NSString *)normalImage andSelectImage:(NSString *)selectImage;
@end
