//
//  UIColor+Utils.h
//  littleFish
//
//  Created by 谢东华 on 15-3-18.
//  Copyright (c) 2015年 littlefish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Utils)

/**
 *  RGB值转换为UIColor对象
 *
 *  @param inColorString RGB值，如“＃808080”这里只需要传入“808080”
 *
 *  @return UIColor对象
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;
@end
