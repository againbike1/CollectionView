//
//  pageListModel.h
//  CollectionView
//
//  Created by blueberry on 15/7/21.
//  Copyright (c) 2015年 blueberry. All rights reserved.
//

#import "JSONModel.h"

@interface pageListModel : JSONModel
@property(nonatomic,strong)NSDictionary<Optional> * background;
@property(nonatomic,strong)NSArray * elements;
@property(nonatomic,strong)NSMutableArray * controls;
@property(nonatomic,strong)NSMutableArray * components;
@end
