//
//  TSBaseViewController.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/6/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"

@interface TSBaseViewController ()

@end

@implementation TSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addOwnSubviews];
    
    [self configOwnSubviews];
    
    [self configOwnProperties];
    
    [self configNaviItem];
    
    [self addOwnSubVC];
    
    [self prepareData];
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
}
- (void)addOwnSubVC {
    
    // MARK: do something in subclass
}

- (void)prepareData {
    // MARK: do something in subclass
    
}
@end
