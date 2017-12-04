//
//  MXBaseNavViewController.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/2.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXBaseNavViewController.h"

@interface MXBaseNavViewController ()

@end

@implementation MXBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - public

//设置navBar透明化 - 暂时没有使用
- (void)setNavigationBarTransparentType
{
    self.navigationBar.translucent = YES;
    UIColor * color = KClearColor;
    CGRect rect = CGRectMake(0.0f,0.0f,KScreenWidth,64);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,[color CGColor]);
    CGContextFillRect(context,rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.clipsToBounds = YES;
}

//为此nav创建button
- (void)setMyNavBtnWithFrame:(CGRect)frame
                   imageName:(NSString *)imageName
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                          target:(id)target
                          action:(SEL)method
{
    UIButton * btn = [MXUIFactory makeButton:frame imageName:imageName title:title textColor:titleColor textFont:FONT_SYSTEM(FONTSIZE_BTN_M) backColor:KClearColor target:target action:method];
 
    [self.view addSubview:btn];
}


#pragma mark - 设置状态颜色

//针对导航栏未隐藏的情状有效 - 隐藏情况看BaseViewController
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

// 如果想要显示状态栏，必须重写这个方法，并return NO
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

//支持旋转
- (BOOL)shouldAutorotate
{
    return YES;
}

//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
