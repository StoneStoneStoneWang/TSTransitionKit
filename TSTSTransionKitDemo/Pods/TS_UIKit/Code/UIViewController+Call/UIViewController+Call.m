//
//  UIViewController+UIViewController_Call.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+Call.h"


@implementation UIViewController (Call)

- (void)call:(NSString *)phone {
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame: [UIScreen mainScreen].bounds];
    
    webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:phone];
    
    [webView loadRequest: [NSURLRequest requestWithURL:url]];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"WebKitDiskImageCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"WebKitOfflineWebApplicationCacheEnabled"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
