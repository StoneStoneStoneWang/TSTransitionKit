#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TSNavigationController.h"
#import "UIViewController+Call.h"
#import "UINavigationController+Orientation.h"
#import "UITabBarController+Orientation.h"
#import "UIViewController+Orientation.h"
#import "UIViewController+StatusBar.h"
#import "TSBaseViewController.h"

FOUNDATION_EXPORT double TS_UIKitVersionNumber;
FOUNDATION_EXPORT const unsigned char TS_UIKitVersionString[];

