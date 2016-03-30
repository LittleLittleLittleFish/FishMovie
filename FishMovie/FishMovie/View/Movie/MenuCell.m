//
//  MenuCell.m
//  FishMovie
//
//  Created by admin on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

-(void)setBriefImageWithPath:(NSString*)path{
    self.contentView.backgroundColor=[UIColor orangeColor];
    self.briefImage=[[UIImageView alloc] initWithFrame:self.contentView.frame];
    [self.briefImage sd_setImageWithURL:[NSURL URLWithString:path]];
    [self.contentView addSubview:self.briefImage];
}

@end
