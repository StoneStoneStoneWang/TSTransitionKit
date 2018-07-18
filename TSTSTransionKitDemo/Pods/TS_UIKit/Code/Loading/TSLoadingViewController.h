//
//  TSLoadingViewController.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseViewController.h"
#import "TSLoadingView.h"
@interface TSLoadingViewController : TSBaseViewController

@property (nonatomic ,strong ,readonly) TSLoadingView *loadingView;

@property (nonatomic ,assign) LoadingStatus loadingStatus;

@end
