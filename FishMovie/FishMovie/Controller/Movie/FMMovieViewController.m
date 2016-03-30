//
//  FMMovieViewController.m
//  FishMovie
//
//  Created by Xiedonghua on 16/3/21.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "FMMovieViewController.h"
#import "PosterView.h"
#import "PosterCell.h"
#import "MenuCell.h"
#import "InterfaceManager.h"
#import "USBoxModel.h"
#import "HomeTableView.h"

@interface FMMovieViewController()


@end

@implementation FMMovieViewController{

    PosterView*_posterView;
    HomeTableView*_tableView;
    
    UIView*buttonContainer;
    UIButton*posterButton;
    UIButton*tableButton;
    
    __weak USBoxModel*model;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title=@"电影";
    [self initSubViews];
    
    [InterfaceManager getUSMovieList:^(int errorCode, NSString *errorMessage, id data) {
        model=data;
        _posterView.dataArray=model.subjects;
        _tableView.dataArray=model.subjects;
        [(UICollectionView*)_posterView.posterCollectionView reloadData];
        [(UICollectionView*)_posterView.menuCollectionView reloadData];
        [_tableView reloadData];
        
    }];
}

-(void)initNavigationBar{
    buttonContainer=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    posterButton = [[UIButton alloc]initWithFrame:buttonContainer.frame];
    [posterButton setImage:[UIImage imageNamed:@"list_home.png"]forState:UIControlStateNormal];
    [posterButton addTarget:self action:@selector(pageOverturn)forControlEvents:UIControlEventTouchUpInside];
    
    tableButton = [[UIButton alloc]initWithFrame:buttonContainer.frame];
    [tableButton setImage:[UIImage imageNamed:@"movie_home.png"]forState:UIControlStateNormal];
    [tableButton addTarget:self action:@selector(pageOverturn)forControlEvents:UIControlEventTouchUpInside];
    
    posterButton.hidden=NO;
    tableButton.hidden=YES;
    
    [buttonContainer addSubview:tableButton];
    [buttonContainer addSubview:posterButton];
    
    
    
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:buttonContainer];
    self.navigationItem.rightBarButtonItem= rightItem;
    
}
-(void)initSubViews{
    
    [self initNavigationBar];
  
    _posterView=[[PosterView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-44)];
    _tableView=[[HomeTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44)];
    _tableView.height=120;
    _posterView.hidden=NO;
    _tableView.hidden=YES;
    

    [self.view addSubview:_tableView];
    [self.view addSubview:_posterView];
    
<<<<<<< Updated upstream
    [InterfaceManager getUSMovieList:^(int errorCode, NSString *errorMessage, id data) {
        if (errorCode==0) {
            self.modelUSBox = data;
            
        }else{
            
        }
    }];
=======
>>>>>>> Stashed changes
    
}

-(void)pageOverturn{
    //button翻转
    posterButton.hidden=!posterButton.hidden;
    tableButton.hidden=!tableButton.hidden;
    [self commitTransitionAnimationWithContainerView:buttonContainer];
    //页面翻转
    _tableView.hidden = !_tableView.hidden;
    _posterView.hidden = !_posterView.hidden;
    [self commitTransitionAnimationWithContainerView:self.view];
}

-(void)commitTransitionAnimationWithContainerView:(UIView*)container{
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:container cache:YES];

    [container exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView commitAnimations];
}




@end
