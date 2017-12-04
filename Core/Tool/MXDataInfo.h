//
//  MXDataInfo.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXDataInfo : NSObject

/**
 *  描述: 字典转为Json字符串
 *
 *  @param dic 字典数据
 *
 *  @return Json字符串
 */
+ (NSString *)dictionaryToJson:(NSDictionary *)dic;


/**
 *  描述: 把格式化的JSON格式的字符串转换成字典
 *
 *  @param jsonString JSON格式的字符串
 *
 *  @return 返回字典
 *
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


//>>>>>>>>>>>>>> 加密 <<<<<<<<<<<<<<<<
/**
 *  描述: 对登录的密码进行加密操作
 *
 *  @param mobilePhone 手机号
 *  @param password 密码的明码
 *
 *  @return 加密后的密码
 */
+ (NSString *)encryptPasswordWithMobilePhone:(NSString *)mobilePhone Password:(NSString *)password;


@end
