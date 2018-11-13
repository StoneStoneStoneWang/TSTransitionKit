//
//  TSNaviAnimation.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNaviAnimation.h"
#import "TSBaseViewController.h"
#import "UIViewController+AnimationTransitioningSnapshot.h"
#import "TSBaseViewController+TS_Transition.h"
#import "UIImage+Cast.h"
#import "TSNaviAnimationManager.h"
#define COVER_TAG 9999

#define KISIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))

@interface TSNaviAnimation()

@end

@implementation TSNaviAnimation

#pragma mark --- push

// push的时候view的层级由上而下是 tonaviview toview cover frombaseview ( tabbar navi fromview)
// 还需要判断当前vc 有没有导航
// 一开始是两个

- (void)push:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 从那个vc来
    id <TSViewControllerPushAnimationDelegate> fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 到那个vc去
    id <TSViewControllerPushAnimationDelegate> toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    TSNaviAnimationManager *manager = [TSNaviAnimationManager shared];
    
    if ([fromVc ts_naviChildViewControllersCount] == 2) {

        [manager removeAll];
    }
    
    [manager startPushFrom:fromVc];
    
    TSNaviAnimationConfig *fromConfig = [manager getCurrentConfigThrough:fromVc];
    // push 时长
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    UIView *fromBaseView = [[UIView alloc] initWithFrame:bounds];
    
    [fromBaseView addSubview: [fromVc get_Ts_childView]];
    
    UIView *topView = [self configTopView:fromConfig];
    
    [fromBaseView addSubview:topView];
    
    CGRect tabbarFrame = fromConfig.tabbarFrame;
    
    UIImageView *tabbarImageView = [[UIImageView alloc] initWithImage:fromConfig.tabbarImage];
    
    tabbarImageView.frame = tabbarFrame;
    
    [fromBaseView addSubview:tabbarImageView];
    
    [fromVc get_Ts_tabbarController].tabBar.hidden = true;
    
    // 需要一个遮盖
    UIView *cover = [[UIView alloc] initWithFrame:bounds];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.alpha = 0;
    
    // 容器view
    UIView *container = [transitionContext containerView];
    
    [container addSubview: [toVc get_Ts_childView]];
    
    [[toVc.get_Ts_naviController.view superview] insertSubview:fromBaseView belowSubview:toVc.get_Ts_naviController.view];
    
    [[[toVc get_Ts_naviController].view superview] insertSubview:cover belowSubview:[toVc get_Ts_naviController].view];
    
    [toVc get_Ts_naviController].view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0);
    
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:1.0
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         fromBaseView.transform = CGAffineTransformMakeScale(0.95, 0.95) ;
                         
                         cover.alpha = 0.3;
                         
                         [toVc get_Ts_naviController].view.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         
                         [[TSNaviAnimationManager shared] endPushTo:toVc];
                         
                         [topView removeFromSuperview];
                         
                         [fromBaseView removeFromSuperview];
                         
                         [transitionContext completeTransition:YES];
                         
                     }];
}
- (void)pushEnded {
    [super pushEnded];
    
    
}

- (UIView *)configTopView:(TSNaviAnimationConfig *)config {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    CGFloat w = CGRectGetWidth(bounds);
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, CGRectGetHeight(config.naviFrame) + CGRectGetHeight(config.statusBarFrame))];
    
    UIImageView *naviImageView = [[UIImageView alloc] initWithImage:config.naviImage];
    
    naviImageView.frame = config.naviFrame;
    
    UINavigationBar *statusBar = [[UINavigationBar alloc] initWithFrame:config.statusBarFrame];
    
    statusBar.barStyle = config.statusStyle;
    
    statusBar.barTintColor = config.statusTintColor;
    
    [topView addSubview:statusBar];
    
    [topView addSubview:naviImageView];
    
    statusBar.hidden = [config prefersNavigationBarHidden];
    
    return topView;
}

#pragma mark --- pop
- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    TSBaseViewController * fromVc   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    TSBaseViewController * toVc     = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    TSNaviAnimationManager *manager = [TSNaviAnimationManager shared];
    
    [manager startPopFrom:fromVc];
    
    TSNaviAnimationConfig *fromConfig = [manager getCurrentConfigThrough:fromVc];
    
    TSNaviAnimationConfig *toConfig =  [manager getCurrentConfigThrough:toVc];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    UIView *toBaseView = [[UIView alloc] initWithFrame:bounds];
    
    [toBaseView addSubview:toVc.view];
    
    UIView *toTopView = [self configTopView:toConfig];
    
    CGRect tabbarFrame = toConfig.tabbarFrame;
    
    UIImageView *tabbarImageView = [[UIImageView alloc] initWithImage:toConfig.tabbarImage];
    
    tabbarImageView.frame = tabbarFrame;
    
    [toBaseView addSubview:toTopView];
    
    [toBaseView addSubview:tabbarImageView];
    
    [toVc get_Ts_naviController].navigationBarHidden = true;
    
    toBaseView.transform = CGAffineTransformMakeScale(0.95, 0.95) ;
    
    UIView *cover = [UIView new];
    
    cover.backgroundColor = [UIColor blackColor];
    
    cover.frame = bounds;
    
    cover.alpha = 0.3;
    
    UIView *container = [transitionContext containerView];
    
    [container addSubview: [fromVc get_Ts_childView]];
    
    [[[fromVc get_Ts_naviController].view superview] insertSubview:toBaseView belowSubview:fromVc.navigationController.view];
    
    [[[fromVc get_Ts_naviController].view superview] insertSubview:cover belowSubview:fromVc.navigationController.view];
    
    UIView *fromTopView = [self configTopView:fromConfig];
    
    [[fromVc get_Ts_naviController].view addSubview:fromTopView];
    
    [fromVc get_Ts_naviController].view.transform = CGAffineTransformIdentity;
    
    [toVc get_Ts_tabbarController].tabBar.hidden = true;
    
    [toVc get_Ts_naviController].navigationBarHidden = true;
    
    if (!fromVc.ts_interactivePopTransition)
    {
        [UIView animateWithDuration:duration
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             fromVc.navigationController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
                             
                             toBaseView.transform = CGAffineTransformIdentity;
                             
                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             
                             [[fromVc get_Ts_childView] removeFromSuperview];
                             
                             [toVc get_Ts_naviController].view.transform = CGAffineTransformIdentity;
                             
                             [toVc get_Ts_naviController].navigationBar.hidden = [toVc ts_prefersNavigationBarHidden];
                             
                             [[toVc get_Ts_childView] removeFromSuperview];
                             
                             [container addSubview: [toVc get_Ts_childView]];
                             
                             [toBaseView removeFromSuperview];
                             
                             [fromTopView removeFromSuperview];
                             
                             [cover removeFromSuperview];
                             
                             [toVc get_Ts_childView].hidden = false;
                             
                             [transitionContext completeTransition:true];
                             
                             [toVc get_Ts_tabbarController].tabBar.hidden = [toVc ts_prefersTabbarHidden];
                             
                             [manager endPopToWithFrom:fromVc];
                             
                         }];
        
    }
    else
    {
        
        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             
                             fromVc.navigationController.view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);
                             
                             toBaseView.transform = CGAffineTransformIdentity;
                             
                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             
                             if ([transitionContext transitionWasCancelled]) {
                                 
                                 [fromVc get_Ts_naviController].navigationBarHidden = [fromVc ts_prefersNavigationBarHidden];
                                 
                             } else {
                                 
                                 [[fromVc get_Ts_childView] removeFromSuperview];
                                 
                                 [toVc get_Ts_naviController].navigationBarHidden = [toVc ts_prefersNavigationBarHidden];
                                 
                                 [[toVc get_Ts_childView] removeFromSuperview];
                                 
                                 [container addSubview: [toVc get_Ts_childView]];
                                 
                                 [toVc get_Ts_childView].hidden = false;
                                 
                                 [toVc get_Ts_tabbarController].tabBar.hidden = [toVc ts_prefersTabbarHidden];
                                 
                                 [manager endPopToWithFrom:fromVc];
                             }
                            
                             [fromTopView removeFromSuperview];
                             
                             [toVc get_Ts_naviController].view.transform = CGAffineTransformIdentity;
                            
                             [toBaseView removeFromSuperview];
                             
                             [cover removeFromSuperview];
                             
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
        
    }
}

// 1006 7062 1855 
@end
