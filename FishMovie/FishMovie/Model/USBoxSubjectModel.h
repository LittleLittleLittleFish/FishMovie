//
//  USBoxSubjectModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USBoxRatingModel.h"
@interface USBoxSubjectModel : JSONModel
@property(nonatomic, strong)USBoxRatingModel<Optional> *rating;
@property(nonatomic, strong)NSNumber<Optional> *collect_count;
@property(nonatomic, strong)NSDictionary<Optional> *images;
@property(nonatomic, strong)NSString<Optional> *id;
@property(nonatomic, strong)NSString<Optional> *alt;
@property(nonatomic, strong)NSString<Optional> *title;
@property(nonatomic, strong)NSString<Optional> *subtype;
@property(nonatomic, strong)NSString<Optional> *year;
@property(nonatomic, strong)NSString<Optional> *original_title;
@end
