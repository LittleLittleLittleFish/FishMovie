//
//  PosterCell.m
//  FishMovie
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "PosterCell.h"
#import "USBoxModel.h"
#import "USBoxSubjectsModel.h"
#import "USBoxSubjectModel.h"
#import "USBoxRatingModel.h"
#import "NegativeView.h"
#import "RankingView.h"
#import "Constant.h"

@implementation PosterCell{
    UIImageView*firstView;
    NegativeView*negativeView;
}
-(void)setModel:(USBoxSubjectsModel*)model{
    [self initSubviewsWithModel:model];
}

-(void)initSubviewsWithModel:(USBoxSubjectsModel*)model{
    //self.backgroundColor=[UIColor yellowColor];
    firstView=[[UIImageView alloc] initWithFrame:self.contentView.frame];
    
    [firstView sd_setImageWithURL:[NSURL URLWithString:model.subject.images[@"medium"]]];
    
    negativeView=[[NegativeView alloc] initWithFrame:self.contentView.frame];
    [negativeView.movieImage sd_setImageWithURL:[NSURL URLWithString:model.subject.images[@"medium"]]];
    negativeView.nameForEnglish.text=model.subject.original_title;
    negativeView.labelForChinese.text=model.subject.title;
    negativeView.yearLabel.text=model.subject.year;
    negativeView.rankingView.score=model.subject.rating.stars.integerValue;
    
    firstView.hidden=NO;
    negativeView.hidden=YES;
 
    [self.contentView addSubview:firstView];
    [self.contentView addSubview:negativeView];
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Transition)];
    [self addGestureRecognizer:tap];
    
}
-(void)Transition{
    [self commitTransitionAnimationWithContainerView:self.contentView];
}
-(void)commitTransitionAnimationWithContainerView:(UIView*)container{
    firstView.hidden = !firstView.hidden;
    negativeView.hidden = !negativeView.hidden;
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:container cache:YES];
    
    [container exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
}
@end
