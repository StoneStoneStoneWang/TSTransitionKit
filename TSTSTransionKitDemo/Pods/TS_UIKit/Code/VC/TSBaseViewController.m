//
//  TSBaseViewController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"
#import "TSColorCommon.h"
@interface TSBaseViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong,readwrite)UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation TSBaseViewController
- (UIWebView *)phoneWebView {
    
    if (!_phoneWebView) {
        
        _phoneWebView = [UIWebView new];
    }
    return _phoneWebView;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
#pragma mark ---- 如果不是通过xib加载的 取消 第一个检查器 use trait variations勾选
    
    //    if (self.navigationController ) {
    //
    //        self.navigationController.navigationBar.translucent = false;
    //    }
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    //        if (self.navigationController ) {
    //
    //            BOOL hasXXXib = true;
    //
    //            @try {
    //                [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    //            } @catch (NSException *exception) {
    //
    //                hasXXXib = false;
    //            } @finally {
    //
    //                NSLog(@"@finally");
    //            }
    //
    //            if (!hasXXXib) {
    //
    //                self.navigationController.navigationBar.translucent = false;
    //            }
    //        }
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //    if (self.navigationController ) {
    //
    //        if (!self.navigationController.navigationBar.isTranslucent && self.navigationController.childViewControllers.count > 1 && !self.navigationController.isNavigationBarHidden) {
    //
    //            CGRect frame = self.view.bounds;
    //
    //            self.view.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame) - 64);
    //        } else {
    //
    //
    //        }
    //    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addOwnSubviews];
    
    [self configOwnSubviews];
    
    [self configOwnProperties];
    
    [self configNaviItem];
    
    [self addOwnSubVC];
    
    [self prepareData];
    
    [self addPanGesture];
    
    self.automaticallyAdjustsScrollViewInsets = false;
}

- (void)addOwnSubviews {
    
    // MARK: do something in subclass
}
- (void)configOwnSubviews {
    
    // MARK: do something in subclass
}
- (void)configNaviItem {
    
    // MARK: do something in subclass
}
- (void)configOwnProperties {
    
    // MARK: do something in subclass
    
    self.view.backgroundColor = BACKGROUND_COLOR;
}
- (void)addOwnSubVC {
    
    // MARK: do something in subclass
}

- (void)prepareData {
    // MARK: do something in subclass
    
}

- (void)addPanGesture {
    
    if (self.navigationController && self != self.navigationController.viewControllers.firstObject)
    {
        UIPanGestureRecognizer *popRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePopRecognizer:)];
        
        [self.view addGestureRecognizer:popRecognizer];
        
        popRecognizer.delegate = self;
    }
}

- (void)handlePopRecognizer:(UIPanGestureRecognizer *)recognizer
{
    CGFloat progress = [recognizer translationInView:self.view].x / CGRectGetWidth(self.view.frame);
    
    progress = MIN(1.0, MAX(0.0, progress));
    
    //    NSLog(@"progress---%.2f",progress);
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        [self.interactivePopTransition updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled)
    {
        if (progress > 0.25)
        {
            [self.interactivePopTransition finishInteractiveTransition];
        }
        else
        {
            [self.interactivePopTransition cancelInteractiveTransition];
        }
        self.interactivePopTransition = nil;
    }
}

// && [gestureRecognizer velocityInView:self.view].x < 100
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer
{
    BOOL result = [gestureRecognizer velocityInView:self.view].x > 0 && [gestureRecognizer locationInView:self.view].x < 100;
    
    return result;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
}
#pragma mark --- phone call
- (void)call:(NSString *)phone {
    
    self.phoneWebView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone]];
    
    [self.phoneWebView loadRequest: [NSURLRequest requestWithURL:url]];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"WebKitDiskImageCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.view endEditing:true];
}
@end
// vc 只做 请求数据 事件处理
// tableview view updateViewData
// 数据的流向
// 


