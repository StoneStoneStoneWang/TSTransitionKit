//
//  UIViewController+PhoneShow.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/15.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TSUIKitHeader.h"
@interface UIViewController (PhoneShow) <UINavigationControllerDelegate ,UIImagePickerControllerDelegate>

@property (nonatomic ,strong) UIImagePickerController *imageicker;

- (void)photoActionShow;

- (void)onCameraShow;

- (void)onPhotoLibShow;

- (void)onSelectImage:(UIImage *)img;

@end
