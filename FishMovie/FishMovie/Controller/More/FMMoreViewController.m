//
//  FMMoreViewController.m
//  FishMovie
//
//  Created by Xiedonghua on 16/3/21.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "FMMoreViewController.h"
#include "Constant.h"
#import <SDWebImageManager.h>
#import "FMAboutViewContorller.h"

@interface FMMoreViewController ()<UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>
{
    NSArray *arrayTitle;
    NSArray *arrayImage;
    
    UITableView *moreTableView;
}

@end

@implementation FMMoreViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self _initParamters];
    [self _initViews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)_initParamters{
    arrayTitle = @[@"清空缓存",
                  @"给个评价",
                  @"商务合作",
                  @"检查新版本",
                  @"欢迎页",
                  @"关于"];
    
    arrayImage = @[[UIImage imageNamed:@"Image_more_clear"],
                  [UIImage imageNamed:@"Image_more_remark"],
                  [UIImage imageNamed:@"Image_more_business"],
                  [UIImage imageNamed:@"Image_more_version"],
                  [UIImage imageNamed:@"Image_more_welcome"],
                  [UIImage imageNamed:@"Image_more_about"]];
    
}

- (void)_initViews{
    moreTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    moreTableView.delegate = self;
    moreTableView.dataSource = self;
    
    [self.view addSubview:moreTableView];
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayTitle.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreTableViewCellIdentifier"];
    
    //不需要复用
    for (UIView *v in cell.contentView.subviews) {
        [v removeFromSuperview];
    }
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreTableViewCellIdentifier"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor colorFromHexRGB:@"4f4f4f"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16];

    cell.imageView.image = [arrayImage objectAtIndex:indexPath.row];
    cell.textLabel.text = [arrayTitle objectAtIndex:indexPath.row];
    
    if (indexPath.row==0) {
        [[SDImageCache sharedImageCache] calculateSizeWithCompletionBlock:^(NSUInteger fileCount, NSUInteger totalSize) {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2fM", totalSize/(1024.0*1024.0)];
        }];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: //清除缓存
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"清空缓存" message:@"确定要清空缓存吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        }
            break;
            case 1: //评价
        {
            
        }
            break;
            case 2: //商务
        {
            
        }
            break;
            case 3: //版本
            
        {
            
        }
            break;
            case 4: //欢迎
        {
            
        }
            break;
            case 5: //关于
        {
            FMAboutViewContorller *aboutVC = [FMAboutViewContorller loadFromNib];
            aboutVC.view.frame = CGRectMake(0, 0, self.view.width, self.view.height);
            [self.navigationController pushViewController:aboutVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark- UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        //清除图片缓存
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [[SDImageCache sharedImageCache] clearDisk];
        });
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"CLEARCACHE" object:nil];
    }
    
    //重新计算缓存大小
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [moreTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
