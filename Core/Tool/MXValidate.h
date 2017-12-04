//
//  MXValidate.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXValidate : NSObject

/**
 *  数字校验
 *
 *  @param string 要验证数字的字符串
 *
 *  @return 有效性的布尔值
 */
+ (BOOL)validateNumber:(NSString *)string;

/**
 *  验证密码
 *
 *  @param passWord 要验证的密码的字符串
 *
 *  @return 有效性的布尔值
 */
+ (BOOL) validatePassword:(NSString *)passWord;


/**
 *  验证验证码
 *
 *  @param code 要验证的验证码的字符串
 *
 *  @return 有效性的布尔值
 */
+ (BOOL) validateCode:(NSString *)code;


/**
 *  邮箱验证
 *
 *  @param email 要验证的邮箱字符串
 *
 *  @return 有效性的布尔值
 */
+ (BOOL) validateEmail:(NSString *)email;


/**
 *  手机号码验证
 *
 *  @param mobile 要验证的手机号字符串
 *
 *  @return 有效性的布尔值
 */
+ (BOOL) validateMobile:(NSString *)mobile;

/**
 *  身份证验证
 *
 *  @param identityCard 要验证的身份证号
 *
 *  @return 有效性的布尔值
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

/**
 *  数组验证
 *
 *  @param data 要验证的数据
 *
 *  @return 数组
 */
+ (NSArray*) validateArray:(id)data;

/**
 *  字典验证
 *
 *  @param data 要验证的数据
 *
 *  @return 字典
 */
+ (NSDictionary*) validateDictionary:(id)data;


/**
 *  验证填写的用户名（可以包含中文、字母、数字、下划线，但下划线不可开头）
 *
 *  @param string 填写的用户名
 *
 *  @return 有效性的布尔值
 */
+ (BOOL) validateUserName:(NSString *)string;


/**
 *  验证填写的内容（可以包含中文、字母、数字、下划线、中英逗号和句号）
 *
 *  @param string 填写的内容
 *
 *  @return 有效性的布尔值
 */
+ (BOOL) validateInputContent:(NSString *)string;

+ (BOOL) validateInputContentMore:(NSString *)string;


/**
 *  描述: 验证支付密码有效性（六位有效数字）
 *
 *  @param string 填写的密码
 *
 *  @return 有效性的布尔值
 */
+ (BOOL)validatePayPassword:(NSString *)string;


/**
 *  描述: 验证银行卡号（15-19位，首位不为0）
 *
 *  @param cardNo 填写的密码
 *
 *  @return 有效性的布尔值
 */
+ (BOOL)validateBankNum:(NSString *)cardNo;


/**
 *  描述: 验证登录密码有效性（至少六位有效字符，至少包含字母数字特殊符号中的两种）
 *
 *  @param string 填写的密码
 *
 *  @return 有效性的布尔值
 */
+ (BOOL)validateLoginPassword:(NSString *)string;

//聊天页种类
typedef NS_ENUM(NSInteger,kValidateType) {
    kValidateType_NumberOnly,       //只允许数字输入
    kValidateType_Email,            //邮箱地址输入
    kValidateType_Normal,           //中文全键盘
    kValidateType_IDCard,           //身份证输入
    kValidateType_Phone,            //手机号输入
    kValidateType_LengthOnly,       //只判断字数
    kValidateType_Code,             //验证码输入
    kValidateType_Name,             //昵称输入
    kValidateType_Bank,             //银行卡号输入
    kValidateType_Password,         //密码输入
    kValidateType_PayPassword,      //支付密码
};


/**
 *  描述: 验证有效输入文本
 *
 *  @param textField 文本字符串
 *  @param minNum    最少输入长度 （若必填项，最少数写1）
 *  @param maxNum    最多输入长度
 *  @param type      校验类型
 *
 *  @return 有效性的布尔值
 */
+ (BOOL)validateTextField:(NSString *)textField minNum:(NSInteger)minNum maxNum:(NSInteger)maxNum type:(kValidateType)type;


/**
 *  描述: 当输入框中的文本长度超过限定长度时，对文本字符串做有效长度截取
 *
 *  @param textField 输入控件
 *  @param length    限定长度
 */
+ (void)restoreValidTextLength:(NSInteger)length textField:(UITextField *)textField;
+ (void)restoreValidTextLength:(NSInteger)length textView:(UITextView*)textView;


/**
 *  描述: 对输入框中的文本做判定是否可以输出
 *
 *  @param textField 输入控件
 *  @param maxLength 限定长度
 *  @param string    当前正输入的文本
 */
+ (BOOL)limitMaxLength:(NSInteger)maxLength textField:(UITextField *)textField replacementString:(NSString *)string;
+ (BOOL)limitMaxLength:(NSInteger)maxLength textView:(UITextView *)textView replacementText:(NSString *)text;



/**
 *  描述: 把手机号部分字符串替换成星号的方法
 *
 *  @param originalStr      原始文本字符串
 *  @param startLocation    开始标星的位置
 *  @param length           标星的长度
 *
 *  @return 替换后的字符串
 */
+ (NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)length;

@end
