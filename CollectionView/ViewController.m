//
//  ViewController.m
//  CollectionView
//
//  Created by blueberry on 15/7/21.
//  Copyright (c) 2015年 blueberry. All rights reserved.
//

#import "ViewController.h"
#import "MYCollectionViewCell.h"

#import "AFHTTPRequestOperationManager.h"
#import "pageListModel.h"
#import "elementsModel.h"
#import "controlsModel.h"
#import "componentsModel.h"

#import "UIImageView+WebCache.h"
#import "intforColor.h"
#import "SPUserResizableView.h"
#import "DBRect.h"

#define GETURL @"http://templ.ibinfen.com/select.php?c=65537&t=19612004507655413&u=10722831021098588326&p=0"
#define PAGEIMAGEEURL @"http://src.ibinfen.com/image.php?u=9377542946905311940&p=16808894707759876149&f="


#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define SPUSERImgTag 20000
#define SPUSERInfor 100

@interface ViewController ()

@end

@implementation ViewController


-(void)loadMoreData
{
    
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    
    [manager GET:GETURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
//        NSLog(@"%@",responseObject);
        
        
        NSDictionary * dataALL=[responseObject objectForKey:@"data"];
        NSArray * pageListArray=[dataALL objectForKey:@"page_list"];
        NSDictionary * clip=[dataALL objectForKey:@"clip"];
        int design_width=[[clip objectForKey:@"width"] intValue];
        
        self.raico=design_width/(SCREENWIDTH-40);
//        model.background=[pageListDict objectForKey:@"background"];
//        model.elements=[pageListDict objectForKey:@"elements"];
//        model.controls=[pageListDict objectForKey:@"controls"];
//        model.components=[pageListDict objectForKey:@"components"];
        
        for (int i=0; i<pageListArray.count; i++) {
            NSDictionary * dictPage=[pageListArray objectAtIndex:i];
            pageListModel * model=[[pageListModel alloc]init];
            
            NSArray * array=[dictPage objectForKey:@"elements"];
//            NSMutableArray * arrMuta=[NSMutableArray arrayWithArray:[self collectionViewLoadElement:array]];
//            for (int j=0; j<array.count; j++) {
//                NSDictionary * element=[array objectAtIndex:i];
//                elementsModel * elemodel=[[elementsModel alloc]init];
//                [elemodel setValuesForKeysWithDictionary:element];
//                [arrMuta addObject:element];
//            }
            model.elements=array;
            model.background=[dictPage objectForKey:@"background"];
            [self.dataArray addObject:model];
            
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSLog(@"主线程------------------");
            [self.collectView reloadData];

        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@" error %@",error);
        
    }];
    
}

-(NSMutableArray *)collectionViewLoadElement:(NSArray *)elments
{
    NSMutableArray * arr=[NSMutableArray arrayWithCapacity:0];
    
    for (int i=0; i<arr.count; i++) {
        elementsModel * elemodel=[[elementsModel alloc]init];
        [elemodel setValuesForKeysWithDictionary:[arr objectAtIndex:i]];
        [arr addObject:elemodel];
    }
    
    return arr;

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.raico=self.raico;
    self.dataArray=[NSMutableArray arrayWithCapacity:0];

    UICollectionViewFlowLayout * flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    flowlayout.minimumLineSpacing=40;
    //UIEdgeInsetsMake(距collectView上边框的距离, 距左边的距离, 距下边的距离, 距右边的距离)
    flowlayout.sectionInset=UIEdgeInsetsMake(0, 20, 0, 20);
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.collectView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH,SCREENHEIGHT-64-49) collectionViewLayout:flowlayout];
    self.collectView.delegate=self;
    self.collectView.dataSource=self;
    self.collectView.backgroundColor=[UIColor blueColor];
    self.collectView.pagingEnabled=YES;
    [self.view addSubview:self.collectView];

    [self.collectView registerClass:[MYCollectionViewCell class] forCellWithReuseIdentifier:@"cellMycollect"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"好使操作============");
        [self loadMoreData];

    });
    
}
#pragma mark 分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataArray.count >0 ? self.dataArray.count : 0;
}
#pragma mark 每个cell设置大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectView.frame.size.width-40, self.collectView.frame.size.height-40);
}
#pragma mark collectView的初始化方式
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    MYCollectionViewCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellMycollect" forIndexPath:indexPath];
    
    pageListModel * polist=[self.dataArray objectAtIndex:indexPath.row];
    
    NSString * stringUrl=[polist.background objectForKey:@"background-image"];
    if ([stringUrl length]>0) {
        
        NSString * tmpImage=[[stringUrl componentsSeparatedByString:@"/"] lastObject];
        NSString * imageURL=[NSString stringWithFormat:@"%@%@",PAGEIMAGEEURL,tmpImage];
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"111111111111111222222222222");

            [cell.backView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
            });
    }else{
    
        NSString * stringColor=[polist.background objectForKey:@"background-color"];
        cell.backView.backgroundColor=[intforColor colorWithHexString:stringColor];
        
    }
//    NSLog(@">>>>>>>>> %@",polist.elements);
    for (int i=0; i<polist.elements.count; i++) {
        
//        elementsModel * element=[polist.elements objectAtIndex:i];

        NSDictionary * element=[polist.elements objectAtIndex:i];
        NSDictionary * position=[element objectForKey:@"position"];
        DBRect * Drect=[[DBRect alloc]init];
        NSDictionary * dicRect=[position objectForKey:@"rect"];
        [Drect setValuesForKeysWithDictionary:dicRect];
        CGRect rect=[Drect forRectWithConversion:CGSizeMake(self.collectView.frame.size.width-40, self.collectView.frame.size.height-40) abili:self.raico];
        
        
        SPUserResizableView * sticker=[[SPUserResizableView alloc]initWithFrame:rect];
        sticker.tag=i+SPUSERImgTag+(i *SPUSERInfor);
        [sticker hideEditingHandles];
        
        if ([[element objectForKey:@"type"] isEqualToString:@"image"]) {
            
            
            UIImageView * imageVeSt=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width,rect.size.height)];
            
            
            NSString * str=[element objectForKey:@"data"];
            NSString * imageDa=[str substringToIndex:6];
            
            if ([imageDa isEqualToString:@"image/"]) {
                
                NSString * imageFor=[NSString stringWithFormat:@"%@%@",PAGEIMAGEEURL,[str substringFromIndex:6]];
                NSLog(@"^^^^^^^^^^^^ %@",imageFor);
                
                
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSLog(@"111111111111111");

                            [imageVeSt sd_setImageWithURL:[NSURL URLWithString:imageFor] placeholderImage:[UIImage imageNamed:@"站位图.png"] options:SDWebImageRefreshCached];
                        
                });
                NSData * data=[NSData dataWithContentsOfURL:[NSURL URLWithString:imageFor]];
                
                //回到主线程
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    NSLog(@"222222222222");
         
                UIImage *imag=[UIImage imageWithData:data];
       
                    sticker.stickerImage=imag;
                });
                
            }else{
                
                
            }
            
            sticker.type=@"image";
            
            sticker.contentView=imageVeSt;
            
            [cell.backView addSubview:sticker];
        }
        
        
        
    }
    
    
    cell.backView.backgroundColor=[UIColor whiteColor];
    cell.contentView.backgroundColor=[UIColor brownColor];
    cell.tag=indexPath.row;
    cell.labelNum.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
#pragma mark 设置cell的点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    MYCollectionViewCell * cell=(MYCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];

    NSLog(@"cell %ld",(long)cell.tag);
}



#pragma mark 长按事件
-(void)actionLongPresss:(UILongPressGestureRecognizer *)longPress
{
    
    if (longPress.state ==UIGestureRecognizerStateBegan) {
       
        NSLog(@"开始删除%ld",(long)longPress.view.tag);
        [self.dataArray removeObjectAtIndex:longPress.view.tag];
        NSIndexPath * indexPath=[NSIndexPath indexPathForRow:longPress.view.tag inSection:0];
        NSArray * deletaItems=@[indexPath];
        [self.collectView deleteItemsAtIndexPaths:deletaItems];
        
    }else if(longPress.state ==UIGestureRecognizerStateEnded){
    
        NSLog(@"长按事件结束");
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
