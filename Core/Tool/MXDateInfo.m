//
//  MXDateInfo.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXDateInfo.h"

@implementation MXDateInfo

//获取当前时间
+(NSString*)getCurrentTime:(NSString *)timeFormatterStr
{
    NSDate* date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    if(timeFormatterStr && ! [timeFormatterStr isEqualToString:@""])
    {
        [dateFormatter setDateFormat:timeFormatterStr];
    }else{
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return  [dateFormatter stringFromDate:date];
}


//获取Date
+(NSDate *)getDateTime:(NSString *)dateForamtterStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateForamtterStr];
    NSDate *date = [dateFormatter dateFromString:dateForamtterStr];
    return date;
}


//获取自1970时间间隔秒数
+(NSString*)getStandardTimeInterval:(NSString *)dateForamtterStr
{
    NSDate *time = [self getDateTime:dateForamtterStr];
    return [NSString stringWithFormat:@"%f",[time timeIntervalSince1970]];
}


//获取比较的时间描述
+(NSString *)getTimeDescrip:(NSString*)sendTime
{
    NSString *timeDes = @"";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //当前时间
    NSDate *datenow = [NSDate date];
    
    NSString *nowtimeStr = [formatter stringFromDate:datenow];
    datenow = [formatter dateFromString:nowtimeStr];
    
    
    //比较时间
    NSDate *date2=[formatter dateFromString:sendTime];
    //间隔
    NSTimeInterval time = [datenow timeIntervalSinceDate:date2];
    
    int days=((int)time)/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    int minutes = ((int)time)%(3600)/60;
    
    if(days == 0 && hours == 0)
    {
        if(minutes <= 5)
        {
            timeDes = @"刚刚";
        }
        else{
            timeDes = [NSString stringWithFormat:@"%d分钟前",minutes];
        }
    }
    if(days == 0 && hours != 0)
    {
        timeDes = [NSString stringWithFormat:@"%d小时前",hours];
    }
    if(days != 0)
    {
        int year = days/365;
        if(year != 0)
        {
            return [NSString stringWithFormat:@"%d年前",year];
        }
        int week = days/7;
        if(week != 0)
        {
            timeDes = [NSString stringWithFormat:@"%d周前",week];
        }
        else{
            timeDes = [NSString stringWithFormat:@"%d天前",days];
        }
    }
    return timeDes;
}


//获取当前年份
+(NSString*)getCurrentYear
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    NSString *year = [formatter stringFromDate:date];
    return year;
}


//获取当前月份
+(NSString*)getCurrentMonth
{
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    NSString *month = [formatter stringFromDate:date];
    return month;
    
}


@end
