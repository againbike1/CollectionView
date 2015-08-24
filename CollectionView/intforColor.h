//
//  intforColor.h
//  BlueBerryStyle
//
//  Created by app_ibinfen_ios on 14-8-11.
//  Copyright (c) 2014年 app_blueberrytech_ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface intforColor : UIColor
//16进制转化UIColor
+ (UIColor *) colorWithHexString: (NSString *)color;

//UIColor转化16进制
+ (NSString *)stringTRUeFromColor:(UIColor *)color;

@end
