//
//  USBoxSubjectsModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
<<<<<<< Updated upstream
#import "USBoxSubjectModel.h"

=======
#import <JSONModel.h>
@class USBoxSubjectModel;
>>>>>>> Stashed changes
@protocol USBoxSubjectsModel<NSObject>
@end

@interface USBoxSubjectsModel : JSONModel
@property(nonatomic, copy)NSString<Optional> *box;
//@property(nonatomic, strong)NSNumber<Optional> *new;
@property(nonatomic, strong)USBoxSubjectModel<Optional> *subject;
//@property(nonatomic, strong)NSDictionary<Optional> *subject;
@property(nonatomic, strong)NSNumber<Optional> *rank;

@end