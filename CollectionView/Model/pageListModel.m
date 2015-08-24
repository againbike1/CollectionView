//
//  pageListModel.m
//  CollectionView
//
//  Created by blueberry on 15/7/21.
//  Copyright (c) 2015年 blueberry. All rights reserved.
//

#import "pageListModel.h"

@implementation pageListModel

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.controls=[NSMutableArray arrayWithCapacity:0];
        self.components=[NSMutableArray arrayWithCapacity:0];
        
    }
    return self;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"还没被赋值的————%@",key);
}
@end
