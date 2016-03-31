//
//  PosterCollectionView.m
//  FishMovie
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"
#import "USBoxModel.h"
#import "Constant.h"

@implementation PosterCollectionView
-(id)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:@"PosterCell"];
    }
    return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH-80, SCREEN_HEIGHT*1/2);
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"PosterCell.h");
    NSString *cellIdentifier = @"PosterCell";

  
    USBoxSubjectsModel*model=self.dataArray[indexPath.row];
    

    PosterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.model=model;
    
    // 我想要点击不是
    if (indexPath==self.selectedIndexPath) {
        cell.contentView.userInteractionEnabled=YES;
    }else{
        cell.contentView.userInteractionEnabled=NO;
    }
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d--%@",indexPath.row,self.selectedIndexPath);
    if (indexPath!=self.selectedIndexPath) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    
    self.selectedIndexPath=indexPath;
}

@end
