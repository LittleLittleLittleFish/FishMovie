//
//  InterfaceManager.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/22.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "USBoxModel.h"

#define POST_T @"POST"
#define GET_T @"GET"

typedef void (^InterfaceManagerBlock)(int errorCode,NSString *errorMessage, id data);

static NSString *const API_US_MOVIE = @"/v2/movie/us_box";

@interface InterfaceManager : NSObject

+ (void)getUSMovieList:(InterfaceManagerBlock)completion;

/**
 *  统一请求接口
 *
 *  @param action      接口名
 *  @param getParams   get参数
 *  @param postParams  post参数
 *  @param returnClass 返回数据类型
 *  @param completion  完成回调block
 *
 *  @return 请求操作
 */
+ (AFHTTPRequestOperation *)startRequest:(NSString *)action
                               getParams:(NSDictionary *)getParams
                              postParams:(NSDictionary *)postParams
                             returnClass:(Class)returnClass
                              completion:(InterfaceManagerBlock)completion;



@end
