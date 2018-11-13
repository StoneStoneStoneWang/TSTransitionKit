//
//  TSNaviAnimation.h
//  TSTSTransionKitDemo
//
//  Created by three stone 王 on 2018/6/30.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseAnimation.h"

// 前言 发现在iOS7系统以上导航栏多了一个translucent属性。这个属性就是设置导航栏是否具有透明度这个功能。
// [[UINavigationBar appearance] setTranslucent:NO];
// self.navigationController.navigationBar.translucent = NO;
// 当translucent = YES，controller中self.view的原点是从导航栏左上角开始计算
// 当translucent = NO，controller中self.view的原点是从导航栏左下角开始计算

// v 1.0.5 之前是有bug存在的 就是转场的时候 由于是屏幕截图 回导致一些效果 比如点击按钮的高亮状态 不是立即消失

// 所以在v 1.0.6之后 修复这个bug
// 1.含有tabbar的一级界面跳转到二级界面 或 二级跳转到三级。。。 
// 2.针对containerview 和fromview 重新布局
// 3.现在已有的网上开源的专场 会有些体验上的不好的地方
// 4.参考已成熟应用 如今日头条


@interface TSNaviAnimation : TSBaseAnimation


@end
