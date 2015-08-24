//
//  ViewController.h
//  CollectionView
//
//  Created by blueberry on 15/7/21.
//  Copyright (c) 2015年 blueberry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)UICollectionView * collectView;
@property(nonatomic,assign)float raico;
@end

