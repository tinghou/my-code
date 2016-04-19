//
//  SwitchMenuViewModel.m
//  moreControllers
//
//  Created by admin on 16/4/19.
//  Copyright © 2016年 tinghou. All rights reserved.
//

#import "SwitchMenuViewModel.h"

@implementation SwitchMenuViewModel
// GCD方式创建单粒
//+(SwitchMenuViewModel *)sharedsegMentTitles
//{
//    static SwitchMenuViewModel * segTitles = nil;
//    static dispatch_once_t once;
//    dispatch_once(&once,^{
//if (segTitles == nil) {
//     segTitles = [[SwitchMenuViewModel alloc]init];
//        }
//    });
//    return segTitles;
//}


+(SwitchMenuViewModel *)sharedsegMentTitles
{
    static SwitchMenuViewModel * segTitles = nil;
    @synchronized(self) {
        if (segTitles == nil) {
            segTitles = [[SwitchMenuViewModel alloc]init];
        }
    }
    return segTitles;
}

@end