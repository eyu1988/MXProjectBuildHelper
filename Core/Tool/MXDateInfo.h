//
//  MXDateInfo.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXDateInfo : NSObject

/**
 *  获取以特定时间格式的当前时刻
 *
 *  @param timeFormatterStr 时间显示格式的字符串
 *
 *  @return 当前时刻的字符串
 */
+(NSString *)getCurrentTime:(NSString *)timeFormatterStr;


/**
 *  获取特定格式的NSDate
 *
 *  @param dateForamtterStr 时间显示格式的字符串
 *
 *  @return 时间的NSDate
 */
+(NSDate *)getDateTime:(NSString *)dateForamtterStr;


/**
 *  获取自1970年的秒数 - 时间戳
 *
 *  @param dateForamtterStr 时间显示格式的字符串
 *
 *  @return 时间戳
 */
+(NSString*)getStandardTimeInterval:(NSString *)dateForamtterStr;


/**
 *  获取特定时间戳与当前时间比较后的描述，如一周前，2个小时前
 *
 *  @param sendTime 时间戳
 *
 *  @return 比较后的时间描述字符串
 */
+(NSString *)getTimeDescrip:(NSString*)sendTime;


/**
 *  获取当前年份
 *
 *  @return 年份的字符串
 */
+(NSString*)getCurrentYear;


/**
 *  获取当前月份
 *
 *  @return 月份的字符串
 */
+(NSString*)getCurrentMonth;


@end
