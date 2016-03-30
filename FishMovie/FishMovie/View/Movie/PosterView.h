//
//  PosterView.h
//  FishMovie
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  IndicateCollectionView;
@class  PosterCollectionView;
@interface PosterView : UIView
@property(nonatomic,strong)NSArray*dataArray;
@property(nonatomic,strong)IndicateCollectionView*menuCollectionView;
@property(nonatomic,strong)PosterCollectionView*posterCollectionView;
@end
