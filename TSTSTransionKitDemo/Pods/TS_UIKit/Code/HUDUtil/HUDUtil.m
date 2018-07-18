//
//  HUDUtil.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/17.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "HUDUtil.h"
#import "SVProgressHUD.h"

static HUDUtil *manager = nil;
@implementation HUDUtil

+ (instancetype)shared {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [HUDUtil new];
    });
    
    return manager;
}
- (void)configHud {
    
    [SVProgressHUD setDefaultStyle:(SVProgressHUDStyleDark)];
    
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    
    [SVProgressHUD setDefaultAnimationType:(SVProgressHUDAnimationTypeFlat)];
    
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeClear)];
}
- (void)showActivity {
    
    [SVProgressHUD show];
}
- (void)showInfo:(NSString *)msg {
    
    [SVProgressHUD showInfoWithStatus:msg];
}
- (void)showWithStatus:(NSString *)msg {
    
    [SVProgressHUD showWithStatus:msg];
    
}
- (void)pop {
    
    [SVProgressHUD popActivity];
}
@end
