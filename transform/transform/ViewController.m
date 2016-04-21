//
//  ViewController.m
//  transform
//
//  Created by Vitco on 16/4/20.
//  Copyright © 2016年 ting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)leftRotate:(id)sender;

- (IBAction)up:(id)sender;

- (IBAction)big:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftRotate:(id)sender {
    // 1.取得头像按钮(第一种方法是脱线变成属性，这里还有如下的一种方法）
    UIButton *head = (UIButton *)[self.view viewWithTag:10];  //这行代码的意思是：传参数10意味著view会到其子空
    // 2.向左旋转45°
    // 45  180
    // 角度是正数:顺时针, 角度是负数:逆时针
#pragma mark 旋转
    //    head.transform = CGAffineTransformMakeRotation(-M_PI_4);  //-M_PI_4：为四分之π
    
#pragma mark 在当前的基础上旋转
    [UIView animateWithDuration:2.0 animations:^{
          head.transform = CGAffineTransformRotate(head.transform, M_PI_4);//在当前的head.transform的基础上再旋转
    }];

}

- (IBAction)up:(id)sender {
    // 1.取得头像按钮
    UIButton *head = (UIButton *)[self.view viewWithTag:10];
#pragma mark 平移
    // 2.每次向上移动100的距离
    //    head.transform = CGAffineTransformMakeTranslation(0, -100);//平移 不能叠加
#pragma mark  在当前的基础上平移
    [UIView animateWithDuration:1.0 animations:^{
         head.transform = CGAffineTransformTranslate(head.transform, 0, -100);//在当前的head.transform的基础上平移
    }];
   
}

- (IBAction)big:(id)sender {
    // 1.取得头像按钮
    UIButton *head = (UIButton *)[self.view viewWithTag:10];
#pragma mark 缩放
    // 2.增大（把宽度和高度都设置得比1大，如：1.5, 1.5），如果要减小则可以把宽度和高度都设置来比1小即可，比如：0.9，0.7）
    //    head.transform = CGAffineTransformMakeScale(1.5, 1.5);//宽度和高度缩放比例
#pragma mark 在当前的基础上缩放
    [UIView animateWithDuration:2.0 animations:^{
        head.transform = CGAffineTransformScale(head.transform, 1.5, 1.5);//在当前的head.transform的基础上缩放
    }];
    

}
@end
