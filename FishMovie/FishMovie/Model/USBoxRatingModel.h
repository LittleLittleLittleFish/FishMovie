//
//  USBoxRatingModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
@interface USBoxRatingModel : JSONModel
@property(nonatomic, strong)NSNumber<Optional> *stars;
@property(nonatomic, strong)NSNumber<Optional> *average;
@property(nonatomic, strong)NSNumber<Optional> *min;
@property(nonatomic, strong)NSNumber<Optional> *max;
@end