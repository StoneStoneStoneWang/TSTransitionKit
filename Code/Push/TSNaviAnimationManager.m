//
//  TSNaviAnimationManager.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSNaviAnimationManager.h"
#import "UINavigationController+Transition.h"

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

@end

@implementation TSNaviAnimationConfig

- (CGRect)statusBarFrame {
    
    if ([self prefersNavigationBarHidden]) {
        
        return CGRectZero;
    }
    
    return CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), KISIphoneX ? 44 : 20);
}

- (CGRect)naviFrame {
    
    if ([self prefersNavigationBarHidden]) {
        
        return CGRectZero;
    }
    
    return CGRectMake(0, KISIphoneX ? 44 : 20, CGRectGetWidth([UIScreen mainScreen].bounds), 44);
}

- (CGRect)tabbarFrame {
    
    if ([self prefersTabbarHidden]) {
        
        return CGRectZero;
    }
    
    return CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds) - (KISIphoneX ? 83 : 49), CGRectGetWidth([UIScreen mainScreen].bounds), (KISIphoneX ? 83 : 49));
}
@end

static TSNaviAnimationManager *manager;

@interface TSNaviAnimationManager()

@property (nonatomic , strong, readwrite) NSMutableArray <TSNaviAnimationConfig *>*viewControllersConfigs;

@end

@implementation TSNaviAnimationManager

+ (instancetype)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [self new];
    });
    
    return manager;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
}

- (NSMutableArray<TSNaviAnimationConfig *> *)viewControllersConfigs {
    
    if (!_viewControllersConfigs) {
        
        _viewControllersConfigs = [NSMutableArray array];
    }
    return _viewControllersConfigs;
}

- (void)startPushFrom:(id <TSViewControllerPushAnimationDelegate>)from {
    
    TSNavigationController *navi = (TSNavigationController *) [from get_Ts_naviController];
    
    UITabBarController *tab = [from get_Ts_tabbarController];
    
    if (!navi) {
        
        return;
    }
    
    TSNaviAnimationConfig *fromConfig = [TSNaviAnimationConfig new];
    
    fromConfig.naviImage = [UIImage ts_imageForView:navi.navigationBar];
    
    fromConfig.tabbarImage = tab ? [UIImage ts_imageForView:tab.tabBar] : nil;
    
    fromConfig.naviFrame = navi.navigationBar.frame;
    
    fromConfig.tabbarFrame = tab ? tab.tabBar.frame : CGRectZero;
    
    fromConfig.prefersTabbarHidden = [from ts_prefersTabbarHidden];
    
    fromConfig.prefersNavigationBarHidden = [from ts_prefersNavigationBarHidden];
    
    fromConfig.statusStyle = navi.navigationBar.barStyle;
    
    fromConfig.statusTintColor = navi.navigationBar.barTintColor;
    
    fromConfig.vc = from;
    
    __block TSNaviAnimationConfig *repaceConfig = nil;
    
    __block NSInteger blockIdx = 0;
    [self.viewControllersConfigs enumerateObjectsUsingBlock:^(TSNaviAnimationConfig * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.vc isEqual:from]) {
            
            repaceConfig = obj;
            
            blockIdx = idx;
            
            return ;
        }
    }];
    
    if (repaceConfig) {
        
        [self.viewControllersConfigs replaceObjectAtIndex:blockIdx withObject:repaceConfig];
    } else {
        
        [self.viewControllersConfigs addObject:fromConfig];
    }
    
}

- (void)endPushTo:(id <TSViewControllerPushAnimationDelegate>)to {
    
    TSNavigationController *navi = (TSNavigationController *) [to get_Ts_naviController];
    
    UITabBarController *tab = [to get_Ts_tabbarController];
    
    TSNaviAnimationConfig *toConfig = [TSNaviAnimationConfig new];
    
    toConfig.naviImage = [UIImage ts_imageForView:navi.navigationBar];
    
    toConfig.tabbarImage = tab ? [UIImage ts_imageForView:tab.tabBar] : nil;
    
    toConfig.naviFrame = navi.navigationBar.frame;
    
    toConfig.tabbarFrame = tab ? tab.tabBar.frame : CGRectZero;
    
    toConfig.prefersTabbarHidden = [to ts_prefersTabbarHidden];
    
//    toConfig.prefersStatusBarHidden = [to ts_prefersStatusBarHidden];
    
    toConfig.prefersNavigationBarHidden = [to ts_prefersNavigationBarHidden];
    
    toConfig.statusStyle = navi.navigationBar.barStyle;
    
    toConfig.statusTintColor = navi.navigationBar.barTintColor;
    
    toConfig.vc = to;
    
    [self.viewControllersConfigs addObject:toConfig];
}

- (void)startPopFrom:(id <TSViewControllerPushAnimationDelegate>)from {
    
    TSNavigationController *navi = (TSNavigationController *) [from get_Ts_naviController];
    
    UITabBarController *tab = [from get_Ts_tabbarController];
    
    TSNaviAnimationConfig *fromConfig = [TSNaviAnimationConfig new];
    
    fromConfig.naviImage = [UIImage ts_imageForView:navi.navigationBar];
    
    fromConfig.tabbarImage = tab ? [UIImage ts_imageForView:tab.tabBar] : nil;
    
    fromConfig.naviFrame = navi.navigationBar.frame;
    
    fromConfig.tabbarFrame = tab ? tab.tabBar.frame : CGRectZero;
    
    fromConfig.prefersTabbarHidden = [from ts_prefersTabbarHidden];
    
//    fromConfig.prefersStatusBarHidden = [from ts_prefersStatusBarHidden];
    
    fromConfig.prefersNavigationBarHidden = [from ts_prefersNavigationBarHidden];
    
    fromConfig.statusStyle = navi.navigationBar.barStyle;
    
    fromConfig.statusTintColor = navi.navigationBar.barTintColor;
    
    fromConfig.vc = from;
    
    __block TSNaviAnimationConfig *replaceConfig = nil;
    
    __block NSInteger blockIdx = 0;
    [self.viewControllersConfigs enumerateObjectsUsingBlock:^(TSNaviAnimationConfig * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.vc isEqual:from]) {
            
            replaceConfig = obj;
            
            blockIdx = idx;
            
            return ;
        }
    }];
    
    if (replaceConfig) {
        
        [self.viewControllersConfigs replaceObjectAtIndex:blockIdx withObject:replaceConfig];
    }
}

- (void)endPopToWithFrom:(id <TSViewControllerPushAnimationDelegate>)from {
    
    TSNaviAnimationConfig *fromConfig = [TSNaviAnimationConfig new];
    
    fromConfig.vc = from;
    
    __block TSNaviAnimationConfig *removeConfig = nil;
    
    __block NSInteger blockIdx = 0;
    [self.viewControllersConfigs enumerateObjectsUsingBlock:^(TSNaviAnimationConfig * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.vc isEqual:from]) {
            
            removeConfig = obj;
            
            blockIdx = idx;
            
            return ;
        }
    }];
    
    if (removeConfig) {
        
        [self.viewControllersConfigs removeObject:removeConfig];
    }
    
    if (self.viewControllersConfigs.count == 1) {
        
        [self.viewControllersConfigs removeAllObjects];
    }
}
- (TSNaviAnimationConfig *)getCurrentConfigThrough:(id <TSViewControllerPushAnimationDelegate>)vc {
    
     __block TSNaviAnimationConfig *currentConfig = nil;
    
    [self.viewControllersConfigs enumerateObjectsUsingBlock:^(TSNaviAnimationConfig * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.vc isEqual:vc]) {
            
            currentConfig = obj;
            
            return ;
        }
    }];
    
    return currentConfig;
}
- (void)removeAll {
    
    [self.viewControllersConfigs removeAllObjects];
}

@end
