//
//  TSColorCommon.h
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/12.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import <UIKit/UIkit.h>

#define TSColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define TAB_NORMAL_COLOR [UIColor colorWithHexString:@"#999999"]

#define TAB_SELECT_COLOR [UIColor colorWithHexString:@"#59b5f8"]

#define LEVEL1_COLOR [UIColor colorWithHexString:@"#333333"]

#define LEVERL2_COLOR [UIColor colorWithHexString:@"#666666"]

#define LEVERL3_COLOR [UIColor colorWithHexString:@"#999999"]

#define BACKGROUND_COLOR [UIColor colorWithHexString:@"#f8f8f8"]

#define SEPERATOR_COLOR [UIColor colorWithHexString:@"#eeeeee"]
@interface UIColor (ColorChange)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)color;

@end

@implementation UIColor (ColorChange)

+ (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
@end

