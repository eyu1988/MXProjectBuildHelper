//
//  MXHttpManager.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXHttpManager.h"
#import <CommonCrypto/CommonDigest.h>
//#import "SecurityUtil.h"

/** 默认超时时间*/
static const NSInteger kNetworkTimeoutInterval = 10;
/** 上传文件超时时间*/
static const NSInteger kNetworkUploadTimeoutInterval = 60;
/** 下载文件超时时间*/
static const NSInteger kNetworkDownloadTimeoutInterval = 60;

@implementation MXHttpManager

#pragma mark - 单例类
+ (AFHTTPSessionManager*)defaultHttpManage
{
    static AFHTTPSessionManager *httpManage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManage = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:NetworkBaseURLString]];
        httpManage.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    });
    return httpManage;
}

#pragma mark - 通用请求方法
+(NSURLSessionDataTask*)httpRequestWithUrl:(NSString*)url
                                parameters:(NSDictionary*)parameters
                                 fileDatas:(NSDictionary<NSString*,NSArray<NSData*>*>*)fileDatas
                             blockProgress:(void(^)(NSProgress* uploadProgress))blockProgress
                              blockSuccess:(void(^)(id responseObject))blockSuccess
                                blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
                              blockFailure:(void(^)(NSString* failureMsg))blockFailure{
    
    AFHTTPSessionManager *httpManage = [MXHttpManager defaultHttpManage];
    httpManage.requestSerializer.timeoutInterval = fileDatas.count?kNetworkUploadTimeoutInterval:kNetworkTimeoutInterval;
    
    return   [httpManage POST:url
                   parameters:parameters
    constructingBodyWithBlock:[MXHttpManager appendData:fileDatas]
                     progress:blockProgress
                      success:[MXHttpManager resBlockSuccess:blockSuccess blockError:blockError]
                      failure:[MXHttpManager resBlockFailure:blockFailure]];
}


#pragma mark - 网络请求方法
#pragma mark >>>网络请求附带文件上传
+(NSURLSessionDataTask*)httpRequestWithUrl:(NSString*)url
                                parameters:(NSDictionary*)parameters
                                 fileDatas:(NSDictionary<NSString*,NSArray<NSData*>*>*)fileDatas
                             blockProgress:(void(^)(NSProgress* uploadProgress))blockProgress
                              blockSuccess:(void(^)(id responseObject))blockSuccess
                                blockError:(void(^)(NSString* errorMsg,id responseObject))blockError {
    
    return [MXHttpManager httpRequestWithUrl:url
                                  parameters:parameters
                                   fileDatas:fileDatas
                               blockProgress:blockProgress
                                blockSuccess:blockSuccess
                                  blockError:blockError
                                blockFailure:^(NSString *failureMsg) {
                                    if (blockError) {
                                        blockError(failureMsg,nil);
                                    }
                                }];
}

#pragma mark >>>简单的网络数据请求
+(NSURLSessionDataTask*)httpRequestWithUrl:(NSString*)url
                                parameters:(NSDictionary*)parameters
                              blockSuccess:(void(^)(id responseObject))blockSuccess
                                blockError:(void(^)(NSString* errorMsg,id responseObject))blockError {
    
    return [MXHttpManager httpRequestWithUrl:url
                                  parameters:parameters
                                   fileDatas:nil
                               blockProgress:nil
                                blockSuccess:blockSuccess
                                  blockError:blockError];
}

#pragma mark >>>网络数据请求下载
+(NSURLSessionDownloadTask*)httpDownloadWithUrl:(NSString *)url
                                       progress:(void (^)(double downloadProgress)) downloadProgressBlock
                                     successful:(void (^)(NSURL *filePath))filePathBlock
                                          error:(void (^)(NSError* error))errorBlock{
    
    NSString *suffix = [url componentsSeparatedByString:@"."].lastObject;
    
    const char* input = [url UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    NSString *name = digest;
    
    
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename=[NSString stringWithFormat:@"%@/%@",path,suffix];
    
    NSFileManager *ma = [NSFileManager defaultManager] ;
    if (![ma fileExistsAtPath:filename]) {
        [ma createDirectoryAtPath:filename withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *str = [NSString stringWithFormat:@"%@/%@",filename,name];
    NSString *filePath = [[str stringByDeletingPathExtension]
                          stringByAppendingPathExtension:suffix];
    
    return [MXHttpManager httpDownloadWithUrl:url
                                     filePath:filePath
                                     progress:downloadProgressBlock
                                   successful:filePathBlock
                                        error:errorBlock];
}


#pragma mark - private

#pragma mark >>>错误显示NSLog报告
+ (void)logNetWorkInfo:(id)info task:(NSURLSessionDataTask *)task{
    NSMutableArray *arrp = [NSMutableArray array];
    NSString *s1 = @"↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓--接口信息";
    NSString *s2 = [NSString stringWithFormat:@"%@",task.currentRequest.URL];
    id cc = task.currentRequest.HTTPBodyStream;
    NSArray *arr = [cc valueForKeyPath:@"_HTTPBodyParts"];
    [arr enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *name = [obj valueForKeyPath:@"_headers"] ;
        NSString* st = [name objectForKey:@"Content-Disposition"];
        NSData *data = [obj valueForKeyPath:@"_body"] ;
        NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
        if (!result) {
            result = [NSString stringWithFormat:@"数据长度%.2fKB",data.length/1000.0];
        }
        st = [[st componentsSeparatedByString:@";"] objectAtIndex:1];
        st = [st componentsSeparatedByString:@"="].lastObject;
        st = [st stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        [arrp addObject:[NSString stringWithFormat:@"%@:%@", st,result]];
    }];
    NSString *s3 = [arrp componentsJoinedByString:@"\n&"];
    NSString *s4 = @"-----------------------------------------------↑请求↑-↓返回↓";
    NSString *s5 = @"↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑--接口信息";
    NSLog(@"\n%@\n%@?\n%@\n%@\n%@\n%@\n\n",s1,s2,s3,s4,info,s5);
}

#pragma mark >>>拼接上传图片语音视频等data
+(id)appendData:(NSDictionary<NSString*,NSArray<NSData*>*>*)fileDatas {
    return ^(id<AFMultipartFormData>  _Nonnull formData) {
        [fileDatas.allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull name, NSUInteger idx, BOOL * _Nonnull stop) {
            [[fileDatas objectForKey:name] enumerateObjectsUsingBlock:^(NSData * _Nonnull data, NSUInteger idx, BOOL * _Nonnull stop) {
                [formData appendPartWithFileData:data
                                            name:[name componentsSeparatedByString:@"."].firstObject
                                        fileName:name
                                        mimeType:@"*/*"];
            }];
        }];
    };
}

#pragma mark >>>接口请求失败后回调
+(id)resBlockFailure:(void(^)(NSString* failureMsg))blockFailure {
    return ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(blockFailure)blockFailure(@"网络异常");
        [MXHttpManager logNetWorkInfo:error task:task];
    };
}

#pragma mark >>>接口请求成功后回调拆解处理
+(id)resBlockSuccess:(void(^)(id responseObject))blockSuccess
          blockError:(void(^)(NSString* errorMsg,id responseObject))blockError {
    return ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *resDic =  responseObject;
        NSString *msg=[resDic objectForKey:@"msg"];
        NSInteger result=[[resDic objectForKey:@"result"] integerValue];
        
        if (result>0){
            if (blockSuccess) blockSuccess(resDic);
        }else{
            if (msg.length == 0) msg = @"未知错误";
            if (blockError) blockError(msg,resDic);
        }
        NSString *st = [MXHttpManager toJSONData:resDic];
        [MXHttpManager logNetWorkInfo:st task:task];
    };
}

#pragma mark >>>下载请求实现
+(NSURLSessionDownloadTask*)httpDownloadWithUrl:(NSString *)url
                                       filePath:(NSString*)filePath
                                       progress:(void (^)(double downloadProgress)) downloadProgressBlock
                                     successful:(void (^)(NSURL *filePath))filePathBlock
                                          error:(void (^)(NSError* error))errorBlock {
    
    
    NSFileManager *ma = [NSFileManager defaultManager];
    BOOL isExists = [ma fileExistsAtPath:filePath];
    
    if (isExists) {
        if (filePathBlock) {
            filePathBlock([NSURL fileURLWithPath:filePath]);
        }
        if (downloadProgressBlock) {
            downloadProgressBlock(1.0);
        }
        return nil;
    }else {
        AFHTTPSessionManager *manage = [MXHttpManager defaultHttpManage];
        manage.requestSerializer.timeoutInterval = kNetworkDownloadTimeoutInterval;
        NSURLRequest *urlRequest =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        NSURLSessionDownloadTask *task =  [manage downloadTaskWithRequest:urlRequest
                                                                 progress:^(NSProgress *progress){
                                                                     if (downloadProgressBlock) {
                                                                         downloadProgressBlock(progress.fractionCompleted);
                                                                     }
                                                                 } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                                                     return [NSURL fileURLWithPath:filePath];
                                                                 } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                                                     if (error) {
                                                                         if (errorBlock) {
                                                                             errorBlock(error);
                                                                         }
                                                                     }else {
                                                                         if (filePathBlock) {
                                                                             filePathBlock(filePath);
                                                                         }
                                                                     }
                                                                 }];
        [task resume];
        return task;
    }
}

#pragma mark >>>json对象字典转json字符串
+(NSString *)toJSONData:(NSDictionary *)theData
{
    if (!theData) {
        return @"";
    }
    NSError *error = nil;
    NSData *jsonData =[NSJSONSerialization dataWithJSONObject:theData
                                                      options:NSJSONWritingPrettyPrinted
                                                        error:&error];
    if ([jsonData length] > 0 && error == nil)
    {
        NSString *jsonString = [[NSString alloc] initWithData :jsonData
                                                      encoding:NSUTF8StringEncoding];
        return jsonString;
    }else{
        return @"";
    }
}

@end
