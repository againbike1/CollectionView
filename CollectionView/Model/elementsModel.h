//
//  elementsModel.h
//  CollectionView
//
//  Created by blueberry on 15/7/21.
//  Copyright (c) 2015年 blueberry. All rights reserved.
//

#import "JSONModel.h"

@interface elementsModel : JSONModel
@property(nonatomic,strong)NSNumber * class;
@property(nonatomic,strong)NSString * type;
@property(nonatomic,strong)NSString * data;
@property(nonatomic,strong)NSArray * animation;
@property(nonatomic,strong)NSDictionary * position;
@property(nonatomic,strong)NSDictionary * style;
@property(nonatomic,strong)NSDictionary * option;


@end
