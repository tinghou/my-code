//
//  ViewController.m
//  moreControllers
//
//  Created by admin on 16/4/19.
//  Copyright © 2016年 tinghou. All rights reserved.
//
#define HTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HTColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define Screen_width [[UIScreen mainScreen] bounds].size.width

#import "ViewController.h"
#import "SwitchMenuView.h"
#import "SwitchMenuViewModel.h"
#import "UIView+Extension.h"
#import "leftViewController.h"
#import "centerViewController.h"
#import "rightViewController.h"
@interface ViewController ()<SwitchMenuViewDelegate>
@property (strong,nonatomic)SwitchMenuView *segmentMenu;
/** 正在显示的控制器 */
@property (nonatomic, weak) UIViewController *showingVc;
/** 用来存放子控制器的view */
@property (nonatomic, weak) UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addsegMenu];
}

-(void)initChileViewControllers{
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
    
    [self addChildViewController:[[leftViewController alloc] init]];
    //    [self.childViewControllers[0] didMoveToParentViewController:self];
    
    [self addChildViewController:[[centerViewController alloc] init]];
    [self addChildViewController:[[rightViewController alloc] init]];
    self.showingVc = self.childViewControllers[0];
    [self.contentView addSubview:self.showingVc.view];
    
}


-(void)addsegMenu
{
   
    SwitchMenuViewModel * titles = [SwitchMenuViewModel sharedsegMentTitles];
    titles.titleArray = [NSMutableArray arrayWithObjects:@"左",@"中",@"右",nil];
    titles.bgColorArray = [NSMutableArray arrayWithObjects:HTColorRGBA(232, 232, 232,0.3),HTColorRGBA(28, 127, 242, 0.5),nil];
    //标题颜色
    UIColor * btnTitleColour = [UIColor whiteColor];
    //标题字体
    //    UIFont * font = [UIFont systemFontOfSize:17];
    UIFont * font = [UIFont boldSystemFontOfSize:16];
    titles.titleEdgeInsets =  [NSMutableArray arrayWithObjects:@0,@10,@0,@0, nil];
    titles.contentEdgeInsets =[NSMutableArray arrayWithObjects:@0,@30,@0,@0,nil];
    titles.titleElements = [NSMutableArray arrayWithObjects:btnTitleColour,font,nil];
    _segmentMenu = [[SwitchMenuView alloc]init];
    _segmentMenu.layer.borderWidth = 1;
    _segmentMenu.layer.cornerRadius = 15;
    _segmentMenu.layer.borderColor = [UIColor whiteColor].CGColor;
    _segmentMenu.layer.masksToBounds = YES;
    _segmentMenu.delegate = self;
    _segmentMenu.height = 30;
    _segmentMenu.x = 10.0;
    _segmentMenu.y = 25.0;
    _segmentMenu.width = Screen_width-20.0;
    [self.view addSubview:_segmentMenu];
}
#pragma mark ---SwitchMenuViewDelegate---
- (void)SwitchMenuView:(SwitchMenuView *)menu didSelectedButtonFromIndex:(int)fromIndex toIndex:(int)toIndex
{
    
   [self initChileViewControllers];
    // 移除其他控制器的view
    [self.showingVc.view removeFromSuperview];
    
    // 获得控制器的位置（索引）
    NSUInteger index = toIndex;
    
    // 当前控制器的索引
    NSUInteger oldIndex = [self.childViewControllers indexOfObject:self.showingVc];
    
    // 添加控制器的view
    self.showingVc = self.childViewControllers[index];
    self.showingVc.view.frame = self.contentView.bounds;
    
    [self.contentView addSubview:self.showingVc.view];
    
    // 动画
    CATransition *animation = [CATransition animation];
    animation.type = @"cube";
    animation.subtype = index > oldIndex ? kCATransitionFromRight:kCATransitionFromLeft;
    
    animation.duration = 0.5;
    //非动画
//    [self.contentView.layer addAnimation:animation forKey:nil];
    //动画
    [self.view.layer addAnimation:animation forKey:nil];
}

@end
