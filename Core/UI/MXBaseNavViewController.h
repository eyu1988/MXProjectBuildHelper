//
//  MXBaseNavViewController.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/2.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXBaseNavViewController : UINavigationController

/**
 *  描述: 设置navBar透明化
 */
- (void)setNavigationBarTransparentType;

/**
 *  描述: 为此nav创建button【会显示在nav层级上】
 *
 *  @param frame        btn的尺寸坐标
 *  @param imageName    图片名称
 *  @param title        标题
 *  @param titleColor   标题颜色
 *  @param target       响应事件的目标
 *  @param method       响应的事件
 */
- (void)setMyNavBtnWithFrame:(CGRect)frame
                   imageName:(NSString *)imageName
                       title:(NSString *)title
                  titleColor:(UIColor *)titleColor
                      target:(id)target
                      action:(SEL)method;

@end
