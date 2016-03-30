//
//  BasicCollectionView.h
//  FishMovie
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicCollectionView : UICollectionView
@property(nonatomic,retain)NSIndexPath *selectedIndexPath;
@property(nonatomic,strong)NSArray*dataArray;
@end
