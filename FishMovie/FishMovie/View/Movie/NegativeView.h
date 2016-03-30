//
//  NegativeView.h
//  FishMovie
//
//  Created by admin on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RankingView;
@interface NegativeView : UIView
@property(nonatomic,strong)UIImageView*movieImage;
@property(nonatomic,strong)UILabel*labelForChinese;
@property(nonatomic,strong)UILabel*nameForEnglish;
@property(nonatomic,strong)UILabel*yearLabel;
@property(nonatomic,strong)RankingView*rankingView;
@end
