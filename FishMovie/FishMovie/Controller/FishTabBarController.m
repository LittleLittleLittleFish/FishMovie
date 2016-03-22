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

- (void)viewDidLoad{
    
}

- (void)_initViews
{
    
    FMMovieViewController *movieVC = [[FMMovieViewController alloc] init];
    FMNewsViewController *newsVC = [[FMNewsViewController alloc] init];
    FMTopViewController *topVC = [[FMTopViewController alloc] init];
    FMCinemaViewController *cinemaVC = [[FMCinemaViewController alloc] init];
    FMMoreViewController *moreVC = [[FMMoreViewController alloc] init];
    
    NSArray *itemArray = @[movieVC, newsVC, topVC, cinemaVC, moreVC];
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    for (int i=0; i<itemArray.count; i++) {
        UIViewController *vc = itemArray[i];
        BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [navArray addObject:baseNav];
    }
    
    self.viewControllers = navArray;
    
}

@end
