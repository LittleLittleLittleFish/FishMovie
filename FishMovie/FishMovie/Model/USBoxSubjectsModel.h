//
//  USBoxSubjectsModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USBoxSubjectModel.h"

@protocol USBoxSubjectsModel<NSObject>
@end

@interface USBoxSubjectsModel : JSONModel
@property(nonatomic, strong)NSString<Optional> *box;
//@property(nonatomic, strong)NSNumber<Optional> *new;
@property(nonatomic, strong)USBoxSubjectModel<Optional> *subject;
@property(nonatomic, strong)NSNumber<Optional> *rank;

@end