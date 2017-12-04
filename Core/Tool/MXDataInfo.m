//
//  MXDataInfo.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXDataInfo.h"
#import "NSString+MXMD5.h"

@implementation MXDataInfo

//字典转为Json字符串
+ (NSString *)dictionaryToJson:(NSDictionary *)dic
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


//json格式字符串转字典：
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    return dic;
}


//加密密码：MD5(手机号+密码)
+ (NSString *)encryptPasswordWithMobilePhone:(NSString *)mobilePhone Password:(NSString *)password
{
    if (StrValid(mobilePhone) && StrValid(password)) {
        NSString * encryption = [[NSString stringWithFormat:@"%@%@", mobilePhone, password] MXMD5ForLower32Bit];
        return encryption;
    }
    return nil;
}

@end
