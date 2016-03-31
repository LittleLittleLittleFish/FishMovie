//
//  TopSubjectModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "RatingModel.h"
#import "TopCharacterModel.h"

@protocol TopSubjectModel <NSObject>

@end

@interface TopSubjectModel : JSONModel

@property(nonatomic, strong)RatingModel<Optional> *rating;
@property(nonatomic, strong)NSArray<Optional> *genres;
@property(nonatomic, strong)NSString<Optional> *title;
@property(nonatomic, strong)NSArray<Optional,TopCharacterModel> *casts;

@end
