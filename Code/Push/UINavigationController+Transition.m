//
//  TSNavigationController+Transition.m
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/11/7.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UINavigationController+Transition.h"
#import <objc/runtime.h>
void __ts__navi__swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector){
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
static const char * implKey = "implKey";
@implementation UINavigationController (Transition)

- (void)set__impl:(UINavigationControllerTransitionImpl *)__impl {
    
    objc_setAssociatedObject(self, implKey, __impl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UINavigationControllerTransitionImpl *)__impl {
    
    return objc_getAssociatedObject(self, implKey);
}

+ (void)load {
    
    [super load];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        __ts__navi__swizzleMethod([self class], @selector(viewDidLoad), @selector(__ts__navi__viewDidLoad));
    });
}

- (void)__ts__navi__viewDidLoad {
    [self __ts__navi__viewDidLoad];

    self.__impl = [UINavigationControllerTransitionImpl new];
    
    self.delegate = self.__impl;
}

@end
