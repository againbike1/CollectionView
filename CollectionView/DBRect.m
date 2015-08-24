//
//  DBRect.m
//  ScreenMedia
//
//  Created by blueberry on 15/7/9.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "DBRect.h"

@implementation DBRect


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"key ---%@",key);
}
-(CGRect)forRectWithConversion:(CGSize)indeSize abili:(float)bili
{
    CGRect rect=CGRectZero;
    

    if ([self.x hasPrefix:@"%"]) {
    
        
        rect.origin.x=indeSize.width * ([self.x intValue]/100);
    }else if([self.x hasPrefix:@"*"]){
        
        rect.origin.x=[self.x intValue];
        
    
    }else{
        
        rect.origin.x=([self.x intValue])/(bili);
    
    }
    
    if ([self.y hasPrefix:@"%"]) {
        
        rect.origin.y=indeSize.width * ([self.y intValue]/100);
        
    }else if([self.y hasPrefix:@"*"]){
        
        rect.origin.y=[self.y intValue];
        
    }else{
        rect.origin.y=([self.y intValue])/(bili);
    
    }
    
    if ([self.w hasPrefix:@"%"]) {
        
        rect.size.width=indeSize.width * ([self.w intValue]/100);
        
    }else if([self.w hasPrefix:@"*"]){
        
        rect.size.width=[self.w intValue];

        
    }else{
    
        rect.size.width=([self.w intValue])/(bili);
    }

    if ([self.h hasPrefix:@"%"]) {
        
        rect.size.height=indeSize.height * ([self.h intValue]/100);
    
    }else if([self.h hasPrefix:@"*"]){
    
        rect.size.height=[self.h intValue];
    }else{
    
        rect.size.height=([self.h intValue])/(bili);
    
    }

    
    
    return rect;
    
}
@end
