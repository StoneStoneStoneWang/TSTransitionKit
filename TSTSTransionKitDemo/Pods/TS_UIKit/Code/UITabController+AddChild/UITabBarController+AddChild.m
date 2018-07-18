//
//  UITabBarController+AddChild.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UITabBarController+AddChild.h"
#import "TSNavigationController.h"
#import "TSColorCommon.h"
@implementation UITabBarController (AddChild)

- (void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title andTabTitle:(NSString *)tabTitle andNormalImage:(NSString *)normalImage andSelectImage:(NSString *)selectImage {
    
    childController.title = title;
    
    childController.tabBarItem.title = tabTitle;
    
    childController.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    childController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    
    [childController.tabBarItem setTitleTextAttributes:@{
                                                         NSForegroundColorAttributeName: TAB_NORMAL_COLOR ,
                                                         NSFontAttributeName: [UIFont systemFontOfSize:10]
                                                         } forState:UIControlStateNormal];
    
    [childController.tabBarItem setTitleTextAttributes:@{
                                                         NSForegroundColorAttributeName: TAB_SELECT_COLOR ,
                                                         NSFontAttributeName: [UIFont systemFontOfSize:10]
                                                         }  forState:UIControlStateSelected];
    
    TSNavigationController *navi = [[TSNavigationController alloc]initWithRootViewController:childController];
    
    [self addChildViewController:navi];
}

@end
