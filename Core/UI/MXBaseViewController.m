//
//  MXBaseViewController.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/2.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXBaseViewController.h"

@interface MXBaseViewController ()

@end

@implementation MXBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = APP_COLOR_BACKGROUND;
    
    if (_hasNavBackBarItem) {
        [self _superMakeUI];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UI
- (void)_superMakeUI
{
    //nav
    UIBarButtonItem * item = [MXUIFactory makeBarButtonItem:CGRectMake(0, 0, 44, 44) imageName:@"icon_navback.png" title:nil textColor:nil textFont:nil target:self action:@selector(myLeftNavBarAction)];
    UIBarButtonItem *leftNegativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftNegativeSpacer.width = -20;
    self.navigationItem.leftBarButtonItems = @[leftNegativeSpacer,item];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - action
- (void)myLeftNavBarAction
{
    NSLog(@"返回");
    
    if (self.navigationController.viewControllers.count == 1) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - 设置状态颜色

//针对导航栏隐藏的情状有效 - 针对导航栏隐藏的情况
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
