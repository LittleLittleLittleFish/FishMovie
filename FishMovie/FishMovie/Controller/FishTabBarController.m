//
//  FishTabBarController.m
//  FishMovie
//
//  Created by Xiedonghua on 16/3/21.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "FishTabBarController.h"
#import "FMMovieViewController.h"
#import "FMNewsViewController.h"
#import "FMTopViewController.h"
#import "FMCinemaViewController.h"
#import "FMMoreViewController.h"
#import "BaseNavigationController.h"

@implementation FishTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//viewDidLoad中不进行复杂的初始化操作
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self _initViews];
}

//viewDidAppear中进行复杂的初始化操作
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)_initViews
{
    NSArray *arrayTitle = @[@"电影",@"新闻",@"Top",@"影院",@"更多"];
    NSArray *arrayImage = @[[UIImage imageNamed:@"Image_tabbar_movie"],
                            [UIImage imageNamed:@"Image_tabbar_news"],
                            [UIImage imageNamed:@"Image_tabbar_top"],
                            [UIImage imageNamed:@"Image_tabbar_cinema"],
                            [UIImage imageNamed:@"Image_tabbar_more"]];
    
    FMMovieViewController *movieVC = [[FMMovieViewController alloc] init];
    FMNewsViewController *newsVC = [[FMNewsViewController alloc] init];
    FMTopViewController *topVC = [[FMTopViewController alloc] init];
    FMCinemaViewController *cinemaVC = [[FMCinemaViewController alloc] init];
    FMMoreViewController *moreVC = [[FMMoreViewController alloc] init];
    
    movieVC.view.backgroundColor = [UIColor greenColor];
    newsVC.view.backgroundColor = [UIColor redColor];
    topVC.view.backgroundColor = [UIColor blueColor];
    cinemaVC.view.backgroundColor = [UIColor yellowColor];
    moreVC.view.backgroundColor = [UIColor cyanColor];
    
    NSArray *itemArray = @[movieVC, newsVC, topVC, cinemaVC, moreVC];
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    for (int i=0; i<itemArray.count; i++) {
        UIViewController *vc = itemArray[i];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:arrayTitle[i] image:arrayImage[i] tag:i];
        [self.tabBar setTintColor:[UIColor orangeColor]];
        [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:12], NSFontAttributeName, nil] forState:UIControlStateNormal];

        vc.tabBarItem = tabBarItem;
        
        BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [navArray addObject:baseNav];
    }
    self.viewControllers = navArray;
}

@end
