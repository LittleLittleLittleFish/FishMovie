//
//  RankingView.m
//  FishMovie
//
//  Created by admin on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "RankingView.h"

@implementation RankingView{
    UIImageView*starBackgroundView;
    UIImageView*starView;
    UILabel*scoreLabel;
}

- (void)awakeFromNib {
    [self initSubviews];
}

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}
-(void)initSubviews{
    //关于内部绘制不了解，什么情况下用什么呢？CGRectZero又有啥用？ ~（＊－＊）~
    starBackgroundView=[[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:starBackgroundView];
    starView=[[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:starView];
    scoreLabel=[[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:scoreLabel];
}

-(void)setScore:(NSInteger)score{
    _score=score;
    [self setNeedsLayout];
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    UIImage *greyStar=[UIImage imageNamed:@"gray@2x.png"];
    
    CGFloat starHeight=greyStar.size.height;
    CGFloat starWidth=greyStar.size.width;
    
    starBackgroundView.backgroundColor=[UIColor colorWithPatternImage:greyStar];
    starBackgroundView.transform=CGAffineTransformMakeScale(self.width/starWidth,self.height/starHeight);
    UIImage *yellowStar=[UIImage imageNamed:@"yellow@2x.png"];
    starView.backgroundColor=[UIColor colorWithPatternImage:yellowStar];
    starView.transform=CGAffineTransformMakeScale(self.width/starWidth, self.height/starHeight);
    
    starBackgroundView.frame = CGRectMake(0, 0, starWidth*5, starHeight);
    starView.frame = CGRectMake(0, 0, starWidth*5, starHeight);
    scoreLabel.frame = CGRectMake(starBackgroundView.right+5, 0, 40, starHeight);
    
    float score = (float)self.score;
    scoreLabel.text = [NSString stringWithFormat:@"%0.1f",score];
    
    //分数的百分比
    float s = score/10;
    //根据分数的百分比调整_yelloView视图的宽度
    starView.width = s * starWidth;
}
@end
