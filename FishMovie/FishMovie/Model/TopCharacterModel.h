//
//  TopCharacterModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol TopCharacterModel <NSObject>

@end

@interface TopCharacterModel : JSONModel

@property(nonatomic, strong)NSString<Optional> *alt;
@property(nonatomic, strong)NSString<Optional> *name;
@property(nonatomic, strong)NSString<Optional> *id;
@property(nonatomic, strong)NSDictionary<Optional> *avatars;

@end
