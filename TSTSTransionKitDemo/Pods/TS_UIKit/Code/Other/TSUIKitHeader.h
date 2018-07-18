//
//  TSUIKitHeader.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#define weakify(...) \\
autoreleasepool {} \\
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)

#define strongify(...) \\
try {} @finally {} \\
_Pragma("clang diagnostic push") \\
_Pragma("clang diagnostic ignored \\"-Wshadow\\"") \\
metamacro_foreach(rac_strongify_,, __VA_ARGS__) \\
_Pragma("clang diagnostic pop")

#import "TSBaseViewController.h"

#import "UIBarButtonItem+Setting.h"

#import "TSNavigationController.h"

#import "TSLoadingViewController.h"

#import "UITabBarController+AddChild.h"

#import "TSInnerViewController.h"

#import "UIViewController+StatusBar.h"

#import "UIViewController+Orientation.h"

#import "UINavigationController+Orientation.h"

#import "UITabBarController+Orientation.h"

#import "TSColorCommon.h"

#import "TSBaseTableView.h"

#import "UIViewController+ADDProperty.h"

#import "TSBaseTableViewCell.h"

#import "TSBaseTableBean.h"

#import <JXTAlertManager/JXTAlertManagerHeader.h>

#import "SVProgressHUD.h"

#import "HUDUtil.h"
