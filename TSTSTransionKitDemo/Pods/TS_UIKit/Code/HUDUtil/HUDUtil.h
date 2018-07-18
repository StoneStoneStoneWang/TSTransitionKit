//
//  HUDUtil.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/17.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUDUtil : NSObject

+ (instancetype)shared;

- (void)configHud;

- (void)showActivity;

- (void)showInfo:(NSString *)msg;

- (void)showWithStatus:(NSString *)msg;

- (void)pop;

@end
