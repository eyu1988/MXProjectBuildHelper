//
//  MXHttpManager+FinancingSection.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXHttpManager.h"
#import "MXUserAccountModel.h"

@interface MXHttpManager (FinancingSection)

#pragma mark - 金元宝投资
/**
 *  描述: 金元宝投资页面加载请求(B1_1_8)
 *
 *  @param parameters      参数, 见MXNetworkParameterHelper
 *
 *  @param blockSuccess    请求结束后,成功的回调,responseObject为返回数据对象
 *  @param blockError      请求结束后,失败的回调,errorMsg为返回的错误信息字符串,responseObject为返回数据对象
 *
 *  @return NSURLSessionDataTask 网络请求会话对象
 */
+ (NSURLSessionDataTask*)findUserAccountDetailWithParameters:(NSDictionary*)parameters
                                                blockSuccess:(void(^)(MXUserAccountModel * model))blockSuccess
                                                  blockError:(void(^)(NSString* errorMsg,id responseObject))blockError;

@end
