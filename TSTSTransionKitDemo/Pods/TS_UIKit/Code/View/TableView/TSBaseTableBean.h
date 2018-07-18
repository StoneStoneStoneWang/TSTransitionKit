//
//  TSBaseTableBean.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,BottomLineType) {
    
    BottomLineTypeNormal,
    
    BottomLineTypeNone
};
@interface TSBaseTableBean : NSObject

@property (nonatomic ,assign) CGFloat cellHeight;

@property (nonatomic ,assign) CGFloat sectionHeaderHeight;

@property (nonatomic ,assign) CGFloat sectionFooterHeight;

@property (nonatomic ,assign) BottomLineType lineType;

@end
