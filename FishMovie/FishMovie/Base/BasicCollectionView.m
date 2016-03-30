//
//  BasicCollectionView.m
//  FishMovie
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "BasicCollectionView.h"
@interface BasicCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>
@end
@implementation BasicCollectionView
- (id)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.showsHorizontalScrollIndicator=NO;
        self.dataSource=self;
        self.delegate=self;
        self.selectedIndexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    }
    
    return self;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"count:%d:%@",self.dataArray.count,NSStringFromClass(collectionView.class));
    return self.dataArray.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cell");
  
    NSString *cellIdentifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
   
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    self.selectedIndexPath=indexPath;
}

@end
