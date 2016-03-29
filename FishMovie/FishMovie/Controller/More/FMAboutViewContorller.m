//
//  FMAboutViewContorller.m
//  FishMovie
//
//  Created by Xiedonghua on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "FMAboutViewContorller.h"

@implementation FMAboutViewContorller

+ (instancetype)loadFromNib{
    FMAboutViewContorller *aboutVC = (FMAboutViewContorller *)[[[NSBundle mainBundle] loadNibNamed:@"FMAboutViewController" owner:self options:nil] lastObject];
    return aboutVC;
}

@end
