//
//  MXHttpManager+LoginSection.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXHttpManager+LoginSection.h"

@implementation MXHttpManager (LoginSection)

#pragma mark - 注册
//注册
+ (NSURLSessionDataTask*)registerWithParameters:(NSDictionary*)parameters
                                   blockSuccess:(void(^)(id responseObject))blockSuccess
                                     blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
{
    return [MXHttpManager httpRequestWithUrl:MXURL_REGISTER
                                  parameters:parameters
                                blockSuccess:^(id responseObject) {
                                    
                                    if (blockSuccess) {
                                        blockSuccess(responseObject);
                                    }
                                }
                                  blockError:blockError];
}

//注册发送验证码
+ (NSURLSessionDataTask*)getRegisterValidCodeWithParameters:(NSDictionary*)parameters
                                               blockSuccess:(void(^)(id responseObject))blockSuccess
                                                 blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
{
    return [MXHttpManager httpRequestWithUrl:MXURL_REGISTER_VALIDCODE
                                  parameters:parameters
                                blockSuccess:^(id responseObject) {
                                    
                                    if (blockSuccess) {
                                        blockSuccess(responseObject);
                                    }
                                }
                                  blockError:blockError];
}


#pragma mark - 登录
//登录
+ (NSURLSessionDataTask*)loginWithParameters:(NSDictionary*)parameters
                                blockSuccess:(void(^)(MXLoginUserModel * loginUserModel))blockSuccess
                                  blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
{
    return [MXHttpManager httpRequestWithUrl:MXURL_LOGIN
                                  parameters:parameters
                                blockSuccess:^(id responseObject) {
                                    
                                    NSDictionary * rootDict = responseObject;
                                    NSDictionary * dataDict = rootDict[@"data"];
                                    MXLoginUserModel * userModel = [[MXLoginUserModel alloc] initWithDictionary:dataDict];
                                    
                                    if (blockSuccess) {
                                        blockSuccess(userModel);
                                    }
                                }
                                  blockError:blockError];
}

//发送手机验证码
+ (NSURLSessionDataTask*)getPhoneValidCodeWithParameters:(NSDictionary*)parameters
                                            blockSuccess:(void(^)(id responseObject))blockSuccess
                                              blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
{
    return [MXHttpManager httpRequestWithUrl:MXURL_SENDCODE
                                  parameters:parameters
                                blockSuccess:^(id responseObject) {
                                    
                                    if (blockSuccess) {
                                        blockSuccess(responseObject);
                                    }
                                }
                                  blockError:blockError];
}

//忘记密码
+ (NSURLSessionDataTask*)findPasswordWithParameters:(NSDictionary*)parameters
                                       blockSuccess:(void(^)(id responseObject))blockSuccess
                                         blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
{
    return [MXHttpManager httpRequestWithUrl:MXURL_FINDPWD
                                  parameters:parameters
                                blockSuccess:^(id responseObject) {
                                    
                                    if (blockSuccess) {
                                        blockSuccess(responseObject);
                                    }
                                }
                                  blockError:blockError];
}

@end
