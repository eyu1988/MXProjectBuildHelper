//
//  MXAlertAction.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXAlertAction : NSObject

/**
 *  描述: 跳转系统设置页alert
 *
 *  @param message 提示显示的信息文本
 */
+ (void)showSystemSettingPageAlertWithMessage:(NSString *)message;

@end
