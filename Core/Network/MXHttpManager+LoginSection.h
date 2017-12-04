//
//  MXHttpManager+LoginSection.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXHttpManager.h"
#import "MXLoginUserModel.h"

@interface MXHttpManager (LoginSection)

#pragma mark - 注册
/**
 *  描述: 网络注册请求(A5)
 *
 *  @param parameters      参数, 见MXNetworkParameterHelper
 *
 *  @param blockSuccess    请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError      请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+ (NSURLSessionDataTask*)registerWithParameters:(NSDictionary*)parameters
                                   blockSuccess:(void(^)(id responseObject))blockSuccess
                                     blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;

/**
 *  描述: 注册验证码请求(A5 或 更换手机号页验证码请求D1_1_3_3)
 *
 *  @param parameters      参数, 见MXNetworkParameterHelper
 *
 *  @param blockSuccess    请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError      请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+ (NSURLSessionDataTask*)getRegisterValidCodeWithParameters:(NSDictionary*)parameters
                                               blockSuccess:(void(^)(id responseObject))blockSuccess
                                                 blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;

#pragma mark - 登录
/**
 *  描述: 网络登录请求(A6)
 *
 *  @param parameters      参数, 见MXNetworkParameterHelper
 *
 *  @param blockSuccess    请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError      请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+ (NSURLSessionDataTask*)loginWithParameters:(NSDictionary*)parameters
                                blockSuccess:(void(^)(MXLoginUserModel * loginUserModel))blockSuccess
                                  blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;

/**
 *  描述: 发送手机验证码的网络请求(或 忘记密码时验证码请求A7)
 *
 *  @param parameters      参数, 见MXNetworkParameterHelper
 *
 *  @param blockSuccess    请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError      请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+ (NSURLSessionDataTask*)getPhoneValidCodeWithParameters:(NSDictionary*)parameters
                                            blockSuccess:(void(^)(id responseObject))blockSuccess
                                              blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;

/**
 *  描述: 忘记密码的网络请求(A7)
 *
 *  @param parameters      参数, 见MXNetworkParameterHelper
 *
 *  @param blockSuccess    请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError      请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+ (NSURLSessionDataTask*)findPasswordWithParameters:(NSDictionary*)parameters
                                       blockSuccess:(void(^)(id responseObject))blockSuccess
                                         blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;


@end
