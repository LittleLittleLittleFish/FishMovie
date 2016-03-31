//
//  HomeTableView.m
//  FishMovie
//
//  Created by admin on 16/3/30.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "HomeTableView.h"
#import "MovieTabelCell.h"
#import "USBoxSubjectsModel.h"
#import "USBoxSubjectModel.h"
#import "USBoxRatingModel.h"
#import "RankingView.h"
#import "Constant.h"

@implementation HomeTableView

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableViewCell");
    static NSString*cellIndentifier=@"MovieTableCell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([MovieTabelCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:cellIndentifier];
        nibsRegistered = YES;
    }
    MovieTabelCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    
    USBoxSubjectsModel*model=self.dataArray[indexPath.row];
    [cell.posterImageView sd_setImageWithURL:[NSURL URLWithString:model.subject.images[@"small"]]];
    cell.nameLabel.text=model.subject.title;
    cell.yearLabel.text=model.subject.year;
    cell.rankingView.score=model.subject.rating.stars.integerValue;
    return cell;
}

@end
