//
//  intforColor.m
//  BlueBerryStyle
//
//  Created by app_ibinfen_ios on 14-8-11.
//  Copyright (c) 2014年 app_blueberrytech_ios. All rights reserved.
//

#import "intforColor.h"

@implementation intforColor

+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

/**
 *  UIColor 转化成16进制颜色值
 *
 *  @param color UIColor
 *
 *  @return 16进制颜色值
 */

+ (NSString *)stringTRUeFromColor:(UIColor *)color
{
    const size_t totalComponents = CGColorGetNumberOfComponents(color.CGColor);
    const CGFloat * components = CGColorGetComponents(color.CGColor);
    return [NSString stringWithFormat:@"#%02X%02X%02X",
            (int)(255 * components[MIN(0,totalComponents-2)]),
            (int)(255 * components[MIN(1,totalComponents-2)]),
            (int)(255 * components[MIN(2,totalComponents-2)])];
}
@end
