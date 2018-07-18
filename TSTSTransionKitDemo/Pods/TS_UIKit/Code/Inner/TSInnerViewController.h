//
//  TSInnerViewController.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"
#import <WebKit/WebKit.h>
#import "TSLoadingViewController.h"
@interface TSInnerViewController : TSLoadingViewController

@property (nonatomic ,strong ,readonly) WKWebView *webView;
#pragma mark --- 设置webview 不能放大缩小
@property (nonatomic ,assign) BOOL zoomScale;

#pragma mark --- 加载数据

- (void)loadReq:(NSString *)url;

- (void)loadHtml:(NSString *)html;

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation;

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end
