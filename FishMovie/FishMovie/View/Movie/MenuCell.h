//
//  MenuCell.h
//  FishMovie
//
//  Created by admin on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *briefImage;
-(void)setBriefImageWithPath:(NSString*)path;
@end
