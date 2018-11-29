//
//  TSBaseViewController+TS_Transition.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+TS_Transition.h"
#import "TSNavigationController.h"
#import "UIColor+ColorTool.h"
#import <objc/runtime.h>
// 利用Category 和Runtime实行方法hook hook方案有一个好处,就是可以避免代码入侵,做到更加广泛的通用性.通过swizzling我们可以将原method与自己加入的method相结合,即不需要在原有工程中加入代码,又能做到全局覆盖

void __ts__view__swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector){
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
#define TS_PanResponseW 100

@implementation UIViewController (AnimationDelegate)

- (void)pushEnded {}

- (void)pushCancled {}

- (void)popEnded {}

- (void)popCancled {}
@end
static const char * ipKey = "ipKey";

static const char * prtKey = "prtKey";

static const char * coKey = "coKey";


@implementation TSBaseViewController (TS_Transition)

- (void)setTs_interactivePopTransition:(UIPercentDrivenInteractiveTransition *)ts_interactivePopTransition {
    
    objc_setAssociatedObject(self, ipKey, ts_interactivePopTransition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIPercentDrivenInteractiveTransition *)ts_interactivePopTransition {
    
    return objc_getAssociatedObject(self, ipKey);
}

- (void)set__config:(TSNaviAnimationConfig *)__config {
    
    objc_setAssociatedObject(self, coKey, __config, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TSNaviAnimationConfig *)__config {
    
    return objc_getAssociatedObject(self, coKey);
}
+ (void)load {
    
    [super load];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __ts__view__swizzleMethod([self class], @selector(viewDidLoad), @selector(__ts__viewDidLoad));
    });
}
- (void)setPanResponseType:(TSPanResponseType)panResponseType {
    
    objc_setAssociatedObject(self, prtKey, @(panResponseType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TSPanResponseType)panResponseType {
    
    return [objc_getAssociatedObject(self, prtKey) integerValue];
}
- (void)__ts__viewDidLoad {
    [self __ts__viewDidLoad];
    
    //由于方法已经被交换,这里调用的实际上是自己的viewdidload
    
    if ([self isAddPopPan]) {
        
        [self addPopPanGesture];
    }
}

- (void)addPopPanGesture {
    //
    if (self.navigationController && self != self.navigationController.viewControllers.firstObject)
    {
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePopRecognizer:)];
        
        [self.view addGestureRecognizer:popRecognizer];
        
        popRecognizer.delegate = self;
    }
}

- (BOOL)isAddPopPan {
    
    return true;
}

- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
    
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.ts_interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        [self.ts_interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled)
    {
        if (progress > 0.25)
        {
            [self.ts_interactivePopTransition finishInteractiveTransition];
        }
        else
        {
            [self.ts_interactivePopTransition cancelInteractiveTransition];
        }
        self.ts_interactivePopTransition = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch (self.panResponseType) {
            case TSPanResponseTypeDefault:
        {
            BOOL result = [gestureRecognizer velocityInView:self.view].x > 0 && [gestureRecognizer locationInView:self.view].x < TS_PanResponseW;
            
            return result;
        }
            case TSPanResponseTypeFull:
        {
            return [gestureRecognizer velocityInView:self.view].x > 0;
        }
            case TSPanResponseTypeCustom:
        {
            BOOL result = [gestureRecognizer velocityInView:self.view].x > 0 && [gestureRecognizer locationInView:self.view].x < self.popPanResponseW;
            
            return result;
        }
        default:
        {
            BOOL result = [gestureRecognizer velocityInView:self.view].x > 0 && [gestureRecognizer locationInView:self.view].x < TS_PanResponseW;
            
            return result;
        }
    }
}

- (CGFloat)popPanResponseW {
    
    return TS_PanResponseW;
}
// 我这只是给一个初始状态 
- (BOOL)ts_prefersNavigationBarHidden {
    
    return false;
}
- (BOOL)ts_prefersTabbarHidden {
    
    return true;
}
- (BOOL)ts_prefersStatusBarHidden {
    
    return false;
}

- (NSInteger)ts_naviChildViewControllersCount {
    
    return self.navigationController.childViewControllers.count;
}
- (UITabBarController *)get_Ts_tabbarController {
    
    return self.tabBarController;
}

- (UINavigationController *)get_Ts_naviController {
    
    return self.navigationController;
}

- (UIView *)get_Ts_childView {
    
    return self.view;
}
@end
