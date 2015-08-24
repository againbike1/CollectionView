//
//  MYCollectionViewCell.m
//  CollectionView
//
//  Created by blueberry on 15/7/21.
//  Copyright (c) 2015年 blueberry. All rights reserved.
//

#import "MYCollectionViewCell.h"

@implementation MYCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self makeUI];
    }
    return self;
}

-(void)makeUI
{
    self.backView=[[UIImageView alloc]initWithFrame:self.contentView.bounds];
    self.backView.userInteractionEnabled=YES;
    [self.contentView addSubview:self.backView];
    
    self.labelNum=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.contentView.frame)-25, CGRectGetHeight(self.contentView.frame)-25, 25, 25)];
    self.labelNum.textAlignment=NSTextAlignmentCenter;
    self.labelNum.contentMode=UIViewContentModeCenter;
    self.labelNum.textColor=[UIColor blueColor];
    [self.contentView addSubview:self.labelNum];
    
    [self.contentView bringSubviewToFront:self.labelNum];
    
}
@end
