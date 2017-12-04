//
//  MXHttpManager+MineSection.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXHttpManager+MineSection.h"

@implementation MXHttpManager (MineSection)

//未读消息数(D1_1)
+ (NSURLSessionDataTask*)findUnreadMessageCountWithParameters:(NSDictionary*)parameters
                                                 blockSuccess:(void(^)(NSUInteger count))blockSuccess
                                                   blockError:(void(^)(NSString* errorMsg,id responseObject))blockError
{
    return [MXHttpManager httpRequestWithUrl:MXURL_MINE_MSGUNREADCOUNT
                                  parameters:parameters
                                blockSuccess:^(id responseObject) {
                                    
                                    NSDictionary * rootDict = responseObject;
                                    NSDictionary * dataDict = rootDict[@"data"];
                                    NSString * count = dataDict[@"count"];
                                    NSInteger c = [count integerValue];
                                    if (c < 0) {
                                        c = 0;
                                    }
                                    
                                    if (blockSuccess) {
                                        blockSuccess(c);
                                    }
                                }
                                  blockError:blockError];
}

@end
