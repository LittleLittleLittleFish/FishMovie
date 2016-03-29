//
//  USBoxSubjectsModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/29.
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

@interface USBoxSubjectModel : JSONModel
@property(nonatomic, strong)USBoxRatingModel<Optional> *rating;
@property(nonatomic, strong)NSNumber<Optional> *collect_count;
@property(nonatomic, strong)NSDictionary<Optional> *images;
@property(nonatomic, copy)NSString<Optional> *id;
@property(nonatomic, copy)NSString<Optional> *alt;
@property(nonatomic, copy)NSString<Optional> *title;
@property(nonatomic, copy)NSString<Optional> *subtype;
@property(nonatomic, copy)NSString<Optional> *year;
@property(nonatomic, copy)NSString<Optional> *original_title;
@end

@protocol USBoxSubjectsModel<NSObject>
@end

@interface USBoxSubjectsModel : JSONModel
@property(nonatomic, copy)NSString<Optional> *box;
//@property(nonatomic, strong)NSNumber<Optional> *new;
@property(nonatomic, strong)USBoxSubjectModel<Optional> *subject;
//@property(nonatomic, strong)NSDictionary<Optional> *subject;
@property(nonatomic, strong)NSNumber<Optional> *rank;

@end