//
//  SwitchMenuViewModel.h
//  moreControllers
//
//  Created by admin on 16/4/19.
//  Copyright © 2016年 tinghou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwitchMenuViewModel : NSObject
+(SwitchMenuViewModel *)sharedsegMentTitles;
//标题数组
@property (nonatomic,strong)NSMutableArray * titleArray;
//颜色数组
@property (nonatomic,strong)NSMutableArray * bgColorArray;
//标题颜色数组
@property (nonatomic,strong)NSMutableArray * TbgColorArray;

@property (nonatomic,strong)NSMutableArray * titleElements;

@property (nonatomic,strong) NSMutableArray * titleEdgeInsets;
@property (nonatomic,strong) NSMutableArray * contentEdgeInsets;

@property (nonatomic,copy) NSString * superViewName;

@end