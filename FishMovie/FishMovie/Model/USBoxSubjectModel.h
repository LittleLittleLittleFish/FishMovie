//
//  USBoxSubjectModel.h
//  FishMovie
//
<<<<<<< Updated upstream
//  Created by Xiedonghua on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USBoxRatingModel.h"

=======
//  Created by admin on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class USBoxRatingModel;
>>>>>>> Stashed changes
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
