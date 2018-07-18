//
//  UIViewController+TSAdd.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/10.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TSDataBlock)(id,id,id);

@interface UIViewController (ADDProperty)

@property (nonatomic ,copy) NSString *identifier;

@property (nonatomic ,copy) TSDataBlock dataBlock;

@end
