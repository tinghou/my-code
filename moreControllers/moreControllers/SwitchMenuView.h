//
//  SwitchMenuView.h
//  moreControllers
//
//  Created by admin on 16/4/19.
//  Copyright © 2016年 tinghou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SwitchMenuView;
@protocol SwitchMenuViewDelegate <NSObject>
@optional
- (void)SwitchMenuView:(SwitchMenuView *)menu didSelectedButtonFromIndex:(int)fromIndex toIndex:(int)toIndex;

@end
@interface SwitchMenuView : UIView
@property (weak,nonatomic) id<SwitchMenuViewDelegate> delegate;
@end
