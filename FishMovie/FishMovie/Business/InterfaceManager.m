//
//  InterfaceManager.m
//  FishMovie
//
//  Created by Xiedonghua on 16/3/22.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "InterfaceManager.h"
#import "Constant.h"
#import <JSONModel.h>

@implementation InterfaceManager

+ (AFHTTPRequestOperation *)startRequest:(NSString *)action getParams:(NSDictionary *)getParams postParams:(NSDictionary *)postParams returnClass:(Class)returnClass completion:(InterfaceManagerBlock)completion
{
    NSString *requestUrl = @"";
    requestUrl = [NSString stringWithFormat:@"%@%@",API_BASE_URL,action];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15.f; //15秒超时
    
    return [manager POST:requestUrl parameters:postParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSData *responseData = [operation responseData];
        NSError *error = nil;
        id result = [self getResultWithData:responseData returnClass:returnClass error:&error];
        if (error) {
            completion(-10000, @"数据解析错误", nil);
        }else{
            completion(0, nil, result);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(-20000, @"网络请求错误", nil);
    }];
}

+ (id)getResultWithData:(NSData *)data returnClass:(Class)returnClass error:(NSError **)error{
    @try {
        NSDictionary *json = nil;
        json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        if (returnClass == nil) {
            return json;
        }
        
        if ([json isKindOfClass:[NSDictionary class]]) {
            if (json && returnClass) {
                return [[returnClass alloc] initWithDictionary:json error:nil];
            }
        }else if([json isKindOfClass:[NSArray class]]){
            NSMutableArray *arrayResult = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in json) {
                [arrayResult addObject:[[returnClass alloc] initWithDictionary:dict error:nil]];
            }
            return arrayResult;
        }else{
            return json;
        }
    }
    @catch (NSException *exception) {
        *error = [[NSError alloc] initWithDomain:exception.reason code:-500 userInfo:exception.userInfo];
        return nil;
    }
    @finally {
        
    }
}


+ (void)getUSMovieList:(InterfaceManagerBlock)completion{
    [self startRequest:API_US_MOVIE getParams:nil postParams:nil returnClass:[USBoxModel class] completion:completion];
}


@end
