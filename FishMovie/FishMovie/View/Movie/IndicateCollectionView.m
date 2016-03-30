
//
//  IndicateCollectionView.m
//  FishMovie
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "IndicateCollectionView.h"
#import "MenuCell.h"
#import "USBoxModel.h"
#import "USBoxSubjectsModel.h"
#import "USBoxSubjectModel.h"
@implementation IndicateCollectionView
-(id)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self registerClass:[MenuCell class] forCellWithReuseIdentifier:@"MenuCell"];
    }
    return self;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"MenuCell";
    
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    USBoxSubjectsModel*model=self.dataArray[indexPath.row];
    [cell setBriefImageWithPath:model.subject.images[@"small"]];

    return cell;
}
@end
