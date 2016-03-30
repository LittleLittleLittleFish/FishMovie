//
//  PosterView.m
//  FishMovie
//
//  Created by admin on 16/3/29.
//  Copyright © 2016年 com.littlefish. All rights reserved.
//

#import "PosterView.h"
#import "IndicateCollectionView.h"
#import "PosterCollectionView.h"
#import "FMFlowLayout.h"
#import "USBoxModel.h"
#import "USBoxSubjectsModel.h"
#import "USBoxSubjectModel.h"

#define CONTAINER_HEIGHT 64
#define MENU_HEIGHT 44
#define INDICATE_BG_HEIGHT 20
#define INDICATE_LENGTH 15
#define NAME_HEIGHT 30
#define LIGHT_TOPMARGIN 8
#define LIGHT_HEIGHT 120


@interface PosterView()
@property(nonatomic,assign)NSInteger selectedNum;
@end
@implementation PosterView{
    UIView*containerView;
    UILabel*movieNameLabel;
    
    UIImageView*lightView1;
    UIImageView*lightView2;
}

-(id)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor orangeColor];
        _selectedNum=0;
        [self initSubViews];
    }
    return self;
}


-(void)initSubViews{
    
    [self creatContentView];
    [self creatHeaderView];
    [self creatLightView];
    [self creatFooterView];
    
}
-(void)setDataArray:(NSArray *)dataArray{
    _dataArray=dataArray;
    _posterCollectionView.dataArray=dataArray;
    _menuCollectionView.dataArray=dataArray;
    USBoxSubjectsModel*model=dataArray[0];
    movieNameLabel.text=model.subject.title;
}
-(void)creatHeaderView{
    containerView=[[UIView alloc] initWithFrame:CGRectMake(0, -MENU_HEIGHT, SCREEN_WIDTH, CONTAINER_HEIGHT)];
    containerView.backgroundColor=[UIColor yellowColor];
    FMFlowLayout*layout=[[FMFlowLayout alloc] init];
    
    _menuCollectionView=[[IndicateCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,MENU_HEIGHT) collectionViewLayout:layout];
    _menuCollectionView.dataArray=self.dataArray;
    _menuCollectionView.backgroundColor=[UIColor blueColor];
    
    //添加观察者
    [_menuCollectionView addObserver:self forKeyPath:@"selectedIndexPath" options:NSKeyValueObservingOptionNew context:NULL];
    

    UIImageView*indicateBackgroundView=[[UIImageView alloc] initWithFrame:CGRectMake(0, MENU_HEIGHT, SCREEN_WIDTH, INDICATE_BG_HEIGHT)];
    indicateBackgroundView.userInteractionEnabled=YES;
    indicateBackgroundView.image=[UIImage imageNamed:@"indexBG_home@2x.png"];
    UIButton*indicateBtn=[[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-INDICATE_LENGTH)/2, 0, INDICATE_LENGTH, INDICATE_LENGTH)];
    [indicateBtn setImage:[UIImage imageNamed:@"down_home@2x.png"] forState:UIControlStateNormal];
    [indicateBtn setImage:[UIImage imageNamed:@"up_home@2x.png"] forState:UIControlStateSelected];
    [indicateBtn addTarget:self action:@selector(TapAction:) forControlEvents:UIControlEventTouchUpInside];

    
    
    [self addSubview:containerView];
    
    [containerView addSubview:_menuCollectionView];
    [containerView addSubview:indicateBackgroundView];
    [indicateBackgroundView addSubview:indicateBtn];
    

}



-(void)creatContentView{
    
    FMFlowLayout*layout=[[FMFlowLayout alloc] init];
    _posterCollectionView=[[PosterCollectionView alloc] initWithFrame:CGRectMake(0, CONTAINER_HEIGHT-MENU_HEIGHT, SCREEN_WIDTH,self.height-(CONTAINER_HEIGHT-MENU_HEIGHT)-NAME_HEIGHT) collectionViewLayout:layout];
    _posterCollectionView.dataArray=self.dataArray;
    _posterCollectionView.backgroundColor=[UIColor redColor];
   
    //添加观察者
    [_posterCollectionView addObserver:self forKeyPath:@"selectedIndexPath" options:NSKeyValueObservingOptionNew context:NULL];
    
    [self addSubview:_posterCollectionView];
}
-(void)creatFooterView{
    movieNameLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,_posterCollectionView.bottom, SCREEN_WIDTH, NAME_HEIGHT)];
    movieNameLabel.backgroundColor=[UIColor purpleColor];
    movieNameLabel.textColor=[UIColor whiteColor];
    movieNameLabel.textAlignment=NSTextAlignmentCenter;

    USBoxSubjectsModel*currentModel=self.dataArray[_selectedNum];
    movieNameLabel.text=currentModel.subject.title;
    [self addSubview:movieNameLabel];
}
-(void)creatLightView{
    lightView1=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/10, 0, SCREEN_WIDTH/5, LIGHT_HEIGHT)];
    lightView2=[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*7/10, 0, SCREEN_WIDTH/5, LIGHT_HEIGHT)];
    lightView1.image=[UIImage imageNamed:@"light.png"];
    lightView2.image=[UIImage imageNamed:@"light.png"];
    [self addSubview:lightView1];
    [self addSubview:lightView2];
}
-(void)TapAction:(UIButton*)sender{
    NSLog(@"tap");
    if (sender.selected==YES) {
        [self hideMenuWithBtn:sender];
    }else{
        [self showMenuWithBtn:sender];
    }
}
-(void)hideMenuWithBtn:(UIButton*)btn{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.4];
    
    //隐藏
    containerView.top -= MENU_HEIGHT;
    lightView1.hidden=NO;
    lightView2.hidden=NO;
    //_menuCollectionView.hidden=YES;
    btn.selected = !btn.selected;
    
    [UIView commitAnimations];
}
-(void)showMenuWithBtn:(UIButton*)btn{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.4];
    
    //显示
    containerView.top += MENU_HEIGHT;
    lightView1.hidden=YES;
    lightView2.hidden=YES;
    //_menuCollectionView.hidden=NO;
    btn.selected = !btn.selected;
    
    [UIView commitAnimations];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    NSLog(@"receive Notification");
    
    if ([keyPath isEqualToString:@"selectedIndexPath"]) {
        //最新的indexPath
        NSIndexPath *indexPath = [change objectForKey:@"new"];
        
        if (object == _posterCollectionView &&
            indexPath.row != _posterCollectionView.selectedIndexPath.row) { //被观察的对象是海报视图
            
            _menuCollectionView.selectedIndexPath = indexPath;
            [_menuCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        
            
        }
        else if(object == _menuCollectionView && indexPath.row != _menuCollectionView.selectedIndexPath.row) { //被观察的对象是索引视图
            
            _posterCollectionView.selectedIndexPath = indexPath;
            [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];;
        }
        
        //修改显示选中的电影标题
        USBoxSubjectsModel *model = self.dataArray[indexPath.row];
        movieNameLabel.text =model.subject.title;
    }
}

@end
