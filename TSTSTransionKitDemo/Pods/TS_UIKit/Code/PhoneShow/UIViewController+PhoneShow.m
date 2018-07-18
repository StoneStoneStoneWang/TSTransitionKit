//
//  UIViewController+PhoneShow.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/15.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "UIViewController+PhoneShow.h"
#import <objc/runtime.h>
@implementation UIViewController (PhoneShow)
- (void)setImageicker:(UIImagePickerController *)imageicker {
    
    objc_setAssociatedObject(self, @"imageicker", imageicker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImagePickerController *)imageicker {
    
    return objc_getAssociatedObject(self, @"imageicker");
}
- (void)photoActionShow {
    
    __weak typeof(self) weakSelf = self;
    
    [self jxt_showActionSheetWithTitle:@"选取图片"
                               message:@""
                     appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                         alertMaker.
                         addActionCancelTitle(@"取消").
                         addActionDestructiveTitle(@"相机").
                         addActionCancelTitle(@"相册");
                     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                         
                         __strong typeof(weakSelf) strongSelf = weakSelf;
                         
                         if ([action.title isEqualToString:@"取消"]) {
                             
                         } else if ([action.title isEqualToString:@"相机"]) {
                             
                             [strongSelf onCameraShow];
                         } else if ([action.title isEqualToString:@"相册"]) {
                             
                             [strongSelf onPhotoLibShow];
                         }
                     }];
}
- (void)onCameraShow {
    
    if (!self.imageicker) {
        
        if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
            
            self.imageicker.delegate = self;
            
            self.imageicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            [self presentViewController:self.imageicker animated:true completion:nil];
        } else {
            
            NSLog(@"模拟器中无法打开相机");
        }
    }
}

- (void)onPhotoLibShow {
    
    if (!self.imageicker) {
        
        self.imageicker.delegate = self;
        
        self.imageicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:self.imageicker animated:true completion:nil];
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:true completion:nil];
    
    UIImage *image = nil;
    
    if (picker.allowsEditing ) {
        
        image = (UIImage *)info[UIImagePickerControllerEditedImage];
    } else {
        
        image = (UIImage *)info[UIImagePickerControllerOriginalImage];
    }
    
    [self performSelector:@selector(onSelectImage:) withObject:image];
}
- (void)onSelectImage:(UIImage *)img {
    
    
}
@end
