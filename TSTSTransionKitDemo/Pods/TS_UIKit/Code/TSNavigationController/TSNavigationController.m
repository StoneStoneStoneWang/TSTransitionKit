//
//  TSNavigationController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/28.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNavigationController.h"
#import "TSNaviAnimation.h"
#import "TSBaseViewController.h"
#import "TSColorCommon.h"
#import "UIBarButtonItem+Setting.h"

@interface BackImageBean: NSObject

@property (nonatomic ,copy) NSString *Back_Image;

+ (BackImageBean *)instance;

@end

@implementation BackImageBean

+ (BackImageBean *)instance {
    
    BackImageBean *image = [BackImageBean new];
    
    NSDictionary *json = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"UMConfig" ofType:@"plist"]];
    
    image.Back_Image = json[@"Back_Image"];
    
    return image;
}

@end

@interface TSNavigationController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@property (nonatomic ,strong) BackImageBean *back_Iamge;

@end

@implementation TSNavigationController

+ (void)initialize {
    
    [[UINavigationBar appearance] setBarTintColor: [UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:18],
                                                           NSForegroundColorAttributeName: LEVEL1_COLOR
                                                           }];
}

- (BackImageBean *)back_Iamge {
    
    if (!_back_Iamge) {
        
        _back_Iamge = [BackImageBean instance];
    }
    return _back_Iamge;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = true;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWith:[UIImage imageNamed:self.back_Iamge.Back_Image] andTarget:self andSelector: @selector(pop)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)pop {
    
    [self popViewControllerAnimated:true];
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    return self.viewControllers.count > 1;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(TSBaseAnimation *) animationController
{
    return animationController.interactivePopTransition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(TSBaseViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    if (fromVC.interactivePopTransition != nil)
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc] initWithType:operation Duration:0.5];
        
        animation.interactivePopTransition = fromVC.interactivePopTransition;
        
        return animation; //手势
    }
    else
    {
        TSNaviAnimation *animation = [[TSNaviAnimation alloc]initWithType:operation Duration:0.5];
        
        return animation;//非手势
    }
}
@end
