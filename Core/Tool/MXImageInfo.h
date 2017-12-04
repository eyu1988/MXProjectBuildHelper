//
//  MXImageInfo.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXImageInfo : NSObject

/**
 *  描述: 通过色值生成纯色图
 *
 *  @param color 色值
 *
 *  @return UIImage纯色图
 */
+ (UIImage *)createImageWithColor:(UIColor*)color;

@end
