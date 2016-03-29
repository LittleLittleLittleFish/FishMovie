//
//  USBoxModel.h
//  FishMovie
//
//  Created by Xiedonghua on 16/3/22.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
#import "USBoxSubjectsModel.h"

//https://api.douban.com/v2/movie/us_box
/*
 {
 "date" : "8月2日 - 8月4日",
 "subjects" : [
     {
        "box" : 27361000,
        "new" : true,
        "subject" : {
            "rating" : {
                "stars" : "40",
                "average" : 7.3,
                "min" : 0,
                "max" : 10
            },
 
            "collect_count" : 49,
            "images" : {
                "small" : "http:\/\/img3.douban.com\/view\/photo\/icon\/public\/p1943399384.jpg",
                "large" : "http:\/\/img3.douban.com\/view\/photo\/photo\/public\/p1943399384.jpg",
                "medium" : "http:\/\/img3.douban.com\/view\/photo\/thumb\/public\/p1943399384.jpg"
            },
            "id" : "3170961",
            "alt" : "http:\/\/movie.douban.com\/subject\/3170961\/",
            "title" : "双枪",
            "subtype" : "movie",
            "year" : "2013",
            "original_title" : "2 Guns"
        },
        "rank" : 1
     }
 ],
 "title" : "豆瓣电影北美票房榜"
 }
 */

@interface USBoxModel : JSONModel

@property(nonatomic, copy)NSString<Optional> *date;
@property(nonatomic, copy)NSString<Optional> *title;
@property(nonatomic, strong)NSArray<Optional, USBoxSubjectsModel> *subjects;

@end
