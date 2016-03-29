//
//  FMMovieViewController.m
//  FishMovie
//
//  Created by Xiedonghua on 16/3/21.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "FMMovieViewController.h"
#import "InterfaceManager.h"
#import "USBoxModel.h"

@interface FMMovieViewController ()

@property(nonatomic, strong)USBoxModel *modelUSBox;

@end

@implementation FMMovieViewController

- (void)viewDidLoad{
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self loadData];
}

- (void)loadData{
    
    [InterfaceManager getUSMovieList:^(int errorCode, NSString *errorMessage, id data) {
        if (errorCode==0) {
            self.modelUSBox = data;
        }
    }];
    
}

@end
