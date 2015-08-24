//
//  elementsModel.m
//  CollectionView
//
//  Created by blueberry on 15/7/21.
//  Copyright (c) 2015年 blueberry. All rights reserved.
//

#import "elementsModel.h"

@implementation elementsModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"还没被赋值的————%@",key);
}
@end
