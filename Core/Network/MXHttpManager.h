//
//  MXHttpManager.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "MXURLDefine.h"

@interface MXHttpManager : NSObject

#pragma mark - 1.网络请求附带文件上传
/**
 *  描述: 网络请求附带文件上传
 *
 *  @param url            网络接口关键字段字符串
 *  @param parameters     上传参数的字典集合,key为参数key,value为参数value
 *  @param fileDatas      上传文件数据的字典集合,key为参数key,value为文件data型
 *  @param blockProgress  上传时进度值实时回调
 *  @param blockSuccess   请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError     请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+(NSURLSessionDataTask*)httpRequestWithUrl:(NSString*)url
                                parameters:(NSDictionary*)parameters
                                 fileDatas:(NSDictionary<NSString*,NSArray<NSData*>*>*)fileDatas
                             blockProgress:(void(^)(NSProgress* uploadProgress))blockProgress
                              blockSuccess:(void(^)(id responseObject))blockSuccess
                                blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;

#pragma mark - 2.简单的网络数据请求
/**
 *  描述: 简单的网络数据请求
 *
 *  @param url            网络接口关键字段字符串
 *  @param parameters     上传参数的字典集合,key为参数key,value为参数value
 *  @param blockSuccess   请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError     请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+(NSURLSessionDataTask*)httpRequestWithUrl:(NSString*)url
                                parameters:(NSDictionary*)parameters
                              blockSuccess:(void(^)(id responseObject))blockSuccess
                                blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;

#pragma mark- 3.网络数据请求下载
/**
 *  描述: 网络数据请求下载
 *
 *  @param url                     网络接口关键字段字符串
 *  @param downloadProgressBlock   文件下载时进度值实时回调
 *  @param filePathBlock           文件下载成功后,在本地存储的NSURL路径
 *  @param errorBlock              文件下载失败后,返回的错误对象
 *
 *  @return NSURLSessionDownloadTask 网络下载请求会话对象
 */
+(NSURLSessionDownloadTask*)httpDownloadWithUrl:(NSString *)url
                                       progress:(void (^)(double downloadProgress)) downloadProgressBlock
                                     successful:(void (^)(NSURL *filePath))filePathBlock
                                          error:(void (^)(NSError* error))errorBlock;

@end
