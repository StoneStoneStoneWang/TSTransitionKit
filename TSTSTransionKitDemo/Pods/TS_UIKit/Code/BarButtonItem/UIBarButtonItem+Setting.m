//
//  UIBarButtonItem+Setting.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/15.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIBarButtonItem+Setting.h"

#import "TSColorCommon.h"

@implementation UIBarButtonItem (Setting)

+ (instancetype)barButtonItemWith:(UIImage *)image andTarget:(id)target andSelector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn sizeToFit];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn] ;
}
+ (instancetype)barButtonItemWith:(NSString *)normalTitle andHighTitle:(NSString *)highTitle andFontSize:(CGFloat)fontSize andTarget:(id)target andSelector:(SEL)selector {
    
    return [self barButtonItemWith:normalTitle andNormalColor:TAB_SELECT_COLOR andHighTitle:highTitle andHighColor:TAB_SELECT_COLOR andFontSize:fontSize andTarget:target andSelector:selector];
}

+ (instancetype)barButtonItemWith:(NSString *)normalTitle andNormalColor:(UIColor *)normalColor andHighTitle:(NSString *)highTitle andHighColor:(UIColor *)highColor andFontSize:(CGFloat)fontSize andTarget:(id)target andSelector:(SEL)selector {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:normalTitle forState:UIControlStateNormal];
    
    [btn setTitle:highTitle forState:UIControlStateHighlighted];
    
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    
    [btn setTitleColor:highColor forState:UIControlStateHighlighted];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [btn sizeToFit];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn] ;
}
@end
