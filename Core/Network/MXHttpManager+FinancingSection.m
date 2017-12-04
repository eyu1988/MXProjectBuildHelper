//
//  MXHttpManager+FinancingSection.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXHttpManager+FinancingSection.h"

@implementation MXHttpManager (FinancingSection)

#pragma mark - 金元宝投资

//金元宝投资页面加载请求(B1_1_8)
+ (NSURLSessionDataTask*)findUserAccountDetailWithParameters:(NSDictionary*)parameters
                                                blockSuccess:(void(^)(MXUserAccountModel * model))blockSuccess
                                                  blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
{
    return [MXHttpManager httpRequestWithUrl:MXURL_FINANCE_USERACCOUNTDETAIL
                                  parameters:parameters
                                blockSuccess:^(id responseObject) {
                                    
                                    NSDictionary * rootDict = responseObject;
                                    NSDictionary * dataDict = rootDict[@"data"];
                                    MXUserAccountModel * model = [[MXUserAccountModel alloc] initWithDictionary:dataDict];
                                    
                                    if (blockSuccess) {
                                        blockSuccess(model);
                                    }
                                }
                                  blockError:blockError];
}

@end
