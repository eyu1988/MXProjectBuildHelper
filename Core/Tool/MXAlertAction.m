//
//  MXAlertAction.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXAlertAction.h"

@implementation MXAlertAction

+ (void)showSystemSettingPageAlertWithMessage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertAction * showAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            
            if( [[UIApplication sharedApplication]canOpenURL:url] ) {
                if (IOS_VERSION_10_OR_LATER){
                    [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:^(BOOL success) {
                        
                    }];
                }
                else{
                    [[UIApplication sharedApplication]openURL:url];
                }
            }
            
        }];
        
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertController * ac = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        [ac addAction:showAction];
        [ac addAction:cancelAction];
        
        UIWindow * window = [UIApplication sharedApplication].windows.lastObject;
        [window.rootViewController presentViewController:ac animated:YES completion:nil];
        
    });
}

@end
