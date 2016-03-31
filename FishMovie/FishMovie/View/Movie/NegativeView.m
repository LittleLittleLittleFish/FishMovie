
//
//  NegativeView.m
//  FishMovie
//
//  Created by admin on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "NegativeView.h"
#import "RankingView.h"
#import "Constant.h"

#define MARGIN 15
@implementation NegativeView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initSubViews];
    }
    return self;
}

-(void)initSubViews{

    _movieImage=[[UIImageView alloc] initWithFrame:CGRectMake(MARGIN, MARGIN, (self.width-MARGIN*2)/2, self.height/3)];
    
    [self addSubview:_movieImage];
    _labelForChinese=[[UILabel alloc] init];
    _labelForChinese.text=@"中文：";
    [self addSubview:_labelForChinese];
    [_labelForChinese mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).with.offset(30);
        make.left.mas_equalTo(_movieImage.mas_right).with.offset(15);
        make.right.mas_equalTo(self.mas_right).with.offset(15);
        make.height.mas_equalTo(21);
    }];
    UILabel*nameForChinese=[[UILabel alloc] init];


    [self addSubview:nameForChinese];
    [nameForChinese mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_labelForChinese.mas_bottom).with.offset(15);
        make.left.mas_equalTo(_movieImage.mas_right).with.offset(15);
        make.right.mas_equalTo(self.mas_right).with.offset(-15);
        //make.height.mas_equalTo(21);
    }];
    UILabel*labelForEnglish=[[UILabel alloc] init];
    labelForEnglish.text=@"英文：";
    [self addSubview:labelForEnglish];
    [labelForEnglish mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameForChinese.mas_top).with.offset(30);
        make.left.mas_equalTo(_movieImage.mas_right).with.offset(15);
        make.right.mas_equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(21);
    }];
    _nameForEnglish=[[UILabel alloc] init];
    [self addSubview:_nameForEnglish];
    [_nameForEnglish mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(labelForEnglish.mas_top).with.offset(30);
        make.left.mas_equalTo(_movieImage.mas_right).with.offset(15);
        make.right.mas_equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(21);
    }];
    _yearLabel=[[UILabel alloc] init];

    [self addSubview:_yearLabel];
    [_yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_movieImage.mas_top).with.offset(10);
        make.left.mas_equalTo(self.mas_left).with.offset(15);
        make.right.mas_equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(21);
    }];
    
    //评分
    _rankingView=[[RankingView alloc] init];
    [self addSubview:_rankingView];
    [_rankingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_yearLabel.mas_bottom).with.offset(10);
        make.left.mas_equalTo(self.mas_left).with.offset(15);
        make.right.mas_equalTo(self.mas_right).with.offset(-15);
        make.height.mas_equalTo(21);
    }];

}

@end
