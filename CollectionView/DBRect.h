//
//  DBRect.h
//  ScreenMedia
//
//  Created by blueberry on 15/7/9.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface DBRect : NSObject

@property(nonatomic,strong)NSString * x;
@property(nonatomic,strong)NSString * y;
@property(nonatomic,strong)NSString * z;
@property(nonatomic,strong)NSString * w;
@property(nonatomic,strong)NSString * h;

-(CGRect)forRectWithConversion:(CGSize)indeSize abili:(float)bili;


@end
