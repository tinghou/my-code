//
//  SwitchMenuView.m
//  moreControllers
//
//  Created by admin on 16/4/19.
//  Copyright © 2016年 tinghou. All rights reserved.
//

#import "SwitchMenuView.h"
#import "SegmentButton.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIView+Extension.h"
#import "UIImage+Extension.h"
#import "SwitchMenuViewModel.h"


@interface SwitchMenuView()
@property (nonatomic, weak) SegmentButton *selectedButton;
@property (nonatomic, strong) NSString * superViewName;
@end

@implementation SwitchMenuView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        SwitchMenuViewModel * seg = [SwitchMenuViewModel sharedsegMentTitles];
        self.backgroundColor = seg.bgColorArray[0];
        _superViewName = seg.superViewName;
        CGFloat alpha = 1;
        for (int i = 0; i< seg.titleArray.count; i++) {
            [self setupBtnWithIcon:@"" title:seg.titleArray[i] bgColor:seg.bgColorArray[1] titleElements:seg.titleElements titleEdgeInsets:seg.titleEdgeInsets contentEdgeInsets:seg.contentEdgeInsets];
        }
    }
    return self;
}

- (void)setDelegate:(id<SwitchMenuViewDelegate>)delegate
{
    
    _delegate = delegate;
    // 默认选中第一个按钮
    [self buttonClick:[self.subviews firstObject]];
    //    [self buttonClick:self.subviews[1]];
}

/**
 *  添加按钮
 *
 *  @param icon  图标
 *  @param title 标题
 */
- (SegmentButton *)setupBtnWithIcon:(NSString *)icon title:(NSString *)title bgColor:(UIColor *)bgColor titleElements:(NSMutableArray *)titleElements titleEdgeInsets:(NSMutableArray *)titleEdgeInsets contentEdgeInsets:(NSMutableArray *)contentEdgeInsets
{
    SegmentButton *btn = [[SegmentButton alloc] init];
    btn.tag = self.subviews.count;
    
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    
    // 设置图片和文字
    [btn setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
#pragma mark 设置标题颜色
    
    [btn setTitleColor:titleElements[0] forState:UIControlStateNormal];
    
    //    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    btn.titleLabel.font = titleElements[1];
    
#pragma mark  设置按钮选中的背景
    [btn setBackgroundImage:[UIImage imageWithColor:bgColor] forState:UIControlStateSelected];
    
    // 设置高亮的时候不要让图标变色
    btn.adjustsImageWhenHighlighted = NO;
    
    // 设置按钮的内容左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    // 设置间距
    btn.titleEdgeInsets = UIEdgeInsetsMake([titleEdgeInsets[0] integerValue], [titleEdgeInsets[1] integerValue], [titleEdgeInsets[2] integerValue], [titleEdgeInsets[3] integerValue]);
    btn.contentEdgeInsets = UIEdgeInsetsMake([contentEdgeInsets[0] integerValue], [contentEdgeInsets[1] integerValue], [contentEdgeInsets[2] integerValue], [contentEdgeInsets[3] integerValue]);
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置按钮的frame
    int btnCount = self.subviews.count;
    
    CGFloat btnH = self.height;
    CGFloat btnW = self.width / btnCount;
    for (int i = 0; i<btnCount; i++) {
        SegmentButton *btn = self.subviews[i];
        btn.width = btnW;
        btn.height = btnH;
        btn.x = i * btnW;
    }
}

#pragma mark - 私有方法
/**
 *  监听按钮点击
 */
- (void)buttonClick:(SegmentButton *)button
{
    // 0.通知代理
    if ([self.delegate respondsToSelector:@selector(SwitchMenuView:didSelectedButtonFromIndex:toIndex:)]) {
        [self.delegate SwitchMenuView:self didSelectedButtonFromIndex:_selectedButton.tag  toIndex:button.tag];
    }
    
    // 1.控制按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}


@end

