//
//  MXMainTabBarViewController.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/2.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXMainTabBarViewController.h"

@interface MXMainTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation MXMainTabBarViewController

- (id)init
{
    self = [super init];
    if (self) {
        [self _makeUI];
    }
    return self;
}

/**
 *  描述: 自定义UI
 */
- (void)_makeUI
{
    MXBaseNavViewController * nav1 = MyVCCreateHelper.showFinancingHomeNav;
    MXBaseNavViewController * nav2 = MyVCCreateHelper.showLoanHomeNav;
    MXBaseNavViewController * nav3 = MyVCCreateHelper.showMineHomeNav;

    self.viewControllers = @[nav1,nav2,nav3];
    
    NSArray *tabbarImageNames = @[@"tabbar_01.png",
                                  @"tabbar_02.png",
                                  @"tabbar_03.png"];
    
    NSArray *tabbarSelectedImageNames = @[@"tabbar_01_selected.png",
                                          @"tabbar_02_selected.png",
                                          @"tabbar_03_selected.png"];
    for (int i = 0; i < self.tabBar.items.count; i++) {
        UITabBarItem * item = self.tabBar.items[i];
        item.imageInsets= UIEdgeInsetsMake(5, 0, -5, 0);
        item.image = IMAGE_NAMED(tabbarImageNames[i]);
        item.selectedImage = IMAGE_NAMED(tabbarSelectedImageNames[i]);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITabBarControllerDelegate


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
