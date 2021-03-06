//
//  TSNaviAnimation.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNaviAnimation.h"
#import "TSBaseViewController.h"
#import "UIViewController+TS_Transition.h"
#import "UIImage+Cast.h"
#import "TSNaviAnimationConfig.h"
#define COVER_TAG 9999

#define KISIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))
@interface UIImage (Navi)

@end

@implementation UIImage (Navi)

+ (UIImage *)ts_imageForView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:false];
    else
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
+ (UIImage *)ts_imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}

@end
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
    
    NSLog(@"%@ ==== %@",fromVc,toVc);
    
    TSNaviAnimationConfig *fromConfig = nil;
    
    if (fromVc.__config) {
        
        fromConfig = fromVc.__config;
    } else {
        
        fromConfig = [TSNaviAnimationConfig new];
    }
    
    fromConfig.prefersNavigationBarHidden = [fromVc ts_prefersNavigationBarHidden];
    
    fromConfig.prefersTabbarHidden = [fromVc ts_prefersTabbarHidden];
    
    fromConfig.naviImage = [UIImage ts_imageForView: fromVc.get_Ts_naviController.navigationBar];
    
    fromConfig.tabbarImage = [UIImage ts_imageForView:fromVc.get_Ts_tabbarController.tabBar];
    
    fromConfig.statusStyle = fromVc.get_Ts_naviController.navigationBar.barStyle;
    
    fromConfig.statusTintColor = fromVc.get_Ts_naviController.navigationBar.barTintColor;
    
    fromVc.__config = fromConfig;
    
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
                         
                         [topView removeFromSuperview];
                         
                         [fromBaseView removeFromSuperview];
                         
                         [transitionContext completeTransition:YES];
                         
                     }];
}

- (UIView *)configTopView:(TSNaviAnimationConfig *)config {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    CGFloat w = CGRectGetWidth(bounds);
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, CGRectGetHeight(config.naviFrame) + CGRectGetHeight(config.statusBarFrame))];
    
    UIImageView *naviImageView = [[UIImageView alloc] initWithImage:config.naviImage];
    
    naviImageView.frame = config.naviFrame;
    
    UIImageView *statusBar = [[UIImageView alloc] initWithFrame:config.statusBarFrame];
    
    statusBar.image = [UIImage ts_imageFromImage:config.naviImage inRect:CGRectMake(0, 0, 1, 1)];
    
    statusBar.contentMode = UIViewContentModeScaleAspectFill;
    
    statusBar.layer.masksToBounds = true;
    
    [topView addSubview:statusBar];
    
    [topView addSubview:naviImageView];
    
    statusBar.hidden = [config prefersNavigationBarHidden];
    
    return topView;
}

#pragma mark --- pop

- (void)pop:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 从那个vc来
    id <TSViewControllerPushAnimationDelegate> fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 到那个vc去
    id <TSViewControllerPushAnimationDelegate> toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    NSLog(@"%@ ==== %@",fromVc,toVc);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];

    CGRect bounds = [[UIScreen mainScreen] bounds];

    UIView *toBaseView = [[UIView alloc] initWithFrame:bounds];

    [toBaseView addSubview: [toVc get_Ts_childView]];

    TSNaviAnimationConfig *fromConfig = nil;
    
    if (fromVc.__config) {
        
        fromConfig = fromVc.__config;
    } else {
        
        fromConfig = [TSNaviAnimationConfig new];
        
        fromVc.__config = fromConfig;
    }
    
    fromConfig.prefersNavigationBarHidden = [fromVc ts_prefersNavigationBarHidden];
    
    fromConfig.prefersTabbarHidden = [fromVc ts_prefersTabbarHidden];
    
    fromConfig.naviImage = [UIImage ts_imageForView: fromVc.get_Ts_naviController.navigationBar];
    
    fromConfig.tabbarImage = [UIImage ts_imageForView:fromVc.get_Ts_tabbarController.tabBar];
    
    fromConfig.statusStyle = fromVc.get_Ts_naviController.navigationBar.barStyle;
    
    fromConfig.statusTintColor = fromVc.get_Ts_naviController.navigationBar.barTintColor;
    
    TSNaviAnimationConfig *toConfig = nil;
    
    NSLog(@"%@ ===",toVc.__config);
    
    if (toVc.__config) {
        
        toConfig = toVc.__config;
    } else {
        
        toConfig = [TSNaviAnimationConfig new];
        
        toVc.__config = toConfig;
    }
    
    UIView *toTopView = [self configTopView:toConfig];

    CGRect tabbarFrame = toConfig.tabbarFrame;

    UIImageView *tabbarImageView = [[UIImageView alloc] initWithImage:toConfig.tabbarImage];

    tabbarImageView.frame = tabbarFrame;

    [toBaseView addSubview:toTopView];

    [toBaseView addSubview:tabbarImageView];

    toBaseView.transform = CGAffineTransformMakeScale(0.95, 0.95) ;

    UIView *cover = [UIView new];

    cover.backgroundColor = [UIColor blackColor];

    cover.frame = bounds;

    cover.alpha = 0.3;

    UIView *container = [transitionContext containerView];

    [container addSubview: [fromVc get_Ts_childView]];

    [[[fromVc get_Ts_naviController].view superview] insertSubview:toBaseView belowSubview:[fromVc get_Ts_naviController].view];

    [[[fromVc get_Ts_naviController].view superview] insertSubview:cover belowSubview:[fromVc get_Ts_naviController].view];

    UIView *fromTopView = [self configTopView:fromConfig];

    [[fromVc get_Ts_naviController].view addSubview:fromTopView];

    [fromVc get_Ts_naviController].view.transform = CGAffineTransformIdentity;

    [toVc get_Ts_tabbarController].tabBar.hidden = true;

    [toVc get_Ts_naviController].navigationBarHidden = true;

    [toVc get_Ts_naviController].navigationItem.title = [toVc get_Ts_naviController].title;
    
    if (!fromVc.ts_interactivePopTransition)
    {
        [UIView animateWithDuration:duration
                              delay:0
             usingSpringWithDamping:1
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{

                             [fromVc get_Ts_naviController].view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);

                             toBaseView.transform = CGAffineTransformIdentity;

                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {

                             [[fromVc get_Ts_childView] removeFromSuperview];

                             [toVc get_Ts_naviController].view.transform = CGAffineTransformIdentity;

                             [toVc get_Ts_naviController].navigationBarHidden = [toVc ts_prefersNavigationBarHidden];

                             [[toVc get_Ts_childView] removeFromSuperview];

                             [container addSubview: [toVc get_Ts_childView]];

                             [toBaseView removeFromSuperview];

                             [fromTopView removeFromSuperview];

                             [cover removeFromSuperview];

                             [toVc get_Ts_childView].hidden = false;

                             [transitionContext completeTransition:true];

                             [toVc get_Ts_tabbarController].tabBar.hidden = [toVc ts_prefersTabbarHidden];

                         }];

    }
    else
    {

        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{

                             [fromVc get_Ts_naviController].view.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(bounds), 0.0);

                             toBaseView.transform = CGAffineTransformIdentity;

                             cover.alpha = 0;
                         }
                         completion:^(BOOL finished) {

                             if ([transitionContext transitionWasCancelled]) {

                                 [fromVc get_Ts_naviController].navigationBarHidden = [toVc ts_prefersNavigationBarHidden];

                             } else {

                                 [[fromVc get_Ts_childView] removeFromSuperview];

                                 [toVc get_Ts_naviController].navigationBarHidden = [toVc ts_prefersNavigationBarHidden];

                                 [[toVc get_Ts_childView] removeFromSuperview];

                                 [container addSubview: [toVc get_Ts_childView]];

                                 [toVc get_Ts_childView].hidden = false;

                                 [toVc get_Ts_tabbarController].tabBar.hidden = [toVc ts_prefersTabbarHidden];


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
