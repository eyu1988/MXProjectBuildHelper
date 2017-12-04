//
//  MXValidate.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXValidate.h"

@implementation MXValidate

//数字校验
+ (BOOL)validateNumber:(NSString *)string
{
    NSString * regex = @"^[0-9]*$";
    NSPredicate * test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:string];
}

//验证密码 - 6-16位数字或字母
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

//验证验证码
+ (BOOL) validateCode:(NSString *)code
{
    NSString *codeRegex = @"^[0-9]{6}+$";
    NSPredicate *codePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",codeRegex];
    return [codePredicate evaluateWithObject:code];
}

//邮箱验证
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以130-139 150-153,155-159  180-189  145,147  170,171,173,176,177,178 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
//身份证号验证
+ (BOOL) validateIdentityCard: (NSString *)identityCard{
    if (identityCard.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[identityCard substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[identityCard substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[identityCard substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}
//数组验证
+ (NSArray*) validateArray:(id)data{
    
    if ([data isKindOfClass:[NSArray class]]) {
        
        return (NSArray*)data;
        
    }
    return [NSArray array];
}
//字典验证
+ (NSDictionary*) validateDictionary:(id)data{
    if ([data isKindOfClass:[NSDictionary class]]) {
        
        return (NSDictionary*)data;
        
    }
    return [NSDictionary dictionary];
}

+ (BOOL) validateUserName:(NSString *)string
{
    NSString * regex = @"^(?!_)[a-zA-Z0-9_\u4e00-\u9fa5]+$";
    NSPredicate * test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:string];
}

+ (BOOL) validateInputContent:(NSString *)string
{
    NSString * regex = @"^[\u4E00-\u9FA5A-Za-z0-9_,.，。]+$";
    NSPredicate * test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:string];
}

+ (BOOL) validateInputContentMore:(NSString *)string
{
    NSString * regex = @"^[\u4E00-\u9FA5A-Za-z0-9/D]+$";
    NSPredicate * test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:string];
}

+ (BOOL)validatePayPassword:(NSString *)string
{
    NSString * regex = @"^[0-9]{6}$";
    NSPredicate * test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:string];
}

+ (BOOL)validateLoginPassword:(NSString *)string
{
    NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)(?!([^(0-9a-zA-Z)]|[\'(\')])+$)([^(0-9a-zA-Z)]|[\'(\')]|[a-zA-Z]|[0-9]){6,}$";
    NSPredicate * test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:string];
}

+ (BOOL)validateBankNum:(NSString *)cardNo
{
    
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1]intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength -1];
    for (int i = cardNoLength -1; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1,1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}





/**
 *  描述: 验证有效输入文本
 *
 *  @param textField 文本字符串
 *  @param minNum    最少输入长度
 *  @param maxNum    最多输入长度
 *  @param type      校验类型
 *
 *  @return 有效性的布尔值
 */
+ (BOOL)validateTextField:(NSString *)textField minNum:(NSInteger)minNum maxNum:(NSInteger)maxNum type:(kValidateType)type
{
    NSInteger length = textField.length;
    
    if (length >= minNum && length <= maxNum && minNum >= 0 && maxNum >= 0) {
        //进入下一级判定
    }
    else{
        return NO;
    }
    
    if (textField.length == 0){
        return YES;
    }
    
    switch (type) {
            
        case kValidateType_NumberOnly:
        {
            return [self validateNumber:textField];
        }
            break;
            
        case kValidateType_Email:
        {
            return [self validateEmail:textField];
        }
            break;
            
        case kValidateType_Normal:
        {
            return YES;//[self validateInputContentMore:textField];
        }
            break;
            
        case kValidateType_LengthOnly:
        {
            
        }
            break;
            
        case kValidateType_IDCard:
        {
            return [self validateIdentityCard:textField];
        }
            break;
            
        case kValidateType_Phone:
        {
            return [self validateMobile:textField];
        }
            break;
            
        case kValidateType_Code:
        {
            return [self validateCode:textField];
        }
            break;
            
        case kValidateType_Name:
        {
            return [self validateUserName:textField];
        }
            break;
            
        case kValidateType_Bank:
        {
            return [self validateBankNum:textField];
        }
            break;
            
        case kValidateType_Password:
        {
            return [self validateLoginPassword:textField];
        }
            break;
            
        case kValidateType_PayPassword:
        {
            return [self validatePayPassword:textField];
        }
            break;
            
        default:
            break;
    }
    return YES;
}

+ (void)restoreValidTextLength:(NSInteger)length textField:(UITextField *)textField
{
    NSString *lang = textField.textInputMode.primaryLanguage; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计、限制等处理
        if (!position) {
            
            if (textField.text.length > length) {
                NSRange range;
                range.location = 0;
                range.length = length;
                textField.text = [textField.text substringWithRange:range];
            }
        }
    }
}

+ (void)restoreValidTextLength:(NSInteger)length textView:(UITextView*)textView
{
    NSString *lang = textView.textInputMode.primaryLanguage; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计、限制等处理
        if (!position) {
            
            if (textView.text.length > length) {
                NSRange range;
                range.location = 0;
                range.length = length;
                textView.text = [textView.text substringWithRange:range];
            }
        }
    }
}

+ (BOOL)limitMaxLength:(NSInteger)maxLength textField:(UITextField *)textField replacementString:(NSString *)string
{
    NSString *lang = textField.textInputMode.primaryLanguage; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计、限制等处理
        if (!position) {
            if (maxLength > 0 && textField.text.length + string.length > maxLength) {
                return NO;
            }
        }else{
            // 有高亮选择的字符串，则暂不对文字进行统计、限制等处理
        }
    }else{
        
        if (maxLength > 0 && textField.text.length + string.length > maxLength) {
            return NO;
        }
    }
    
    return YES;
}

+ (BOOL)limitMaxLength:(NSInteger)maxLength textView:(UITextView *)textView replacementText:(NSString *)text
{
    NSString *lang = textView.textInputMode.primaryLanguage; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        
        UITextRange *selectedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计、限制等处理
        if (!position) {
            if (maxLength > 0 && textView.text.length + text.length > maxLength) {
                return NO;
            }
        }else{
            // 有高亮选择的字符串，则暂不对文字进行统计、限制等处理
        }
    }else{
        
        if (maxLength > 0 && textView.text.length + text.length > maxLength) {
            return NO;
        }
    }
    
    return YES;
}

//把手机号部分字符串替换成星号的方法
+ (NSString *)replaceStringWithAsterisk:(NSString *)originalStr startLocation:(NSInteger)startLocation lenght:(NSInteger)length
{
    if (originalStr.length < startLocation + length){
        NSLog(@"要转换的字符串长度过短");
        return originalStr;
    }
    
    NSString *newStr = originalStr;
    for (int i = 0; i < length; i++) {
        NSRange range = NSMakeRange(startLocation, 1);
        newStr = [newStr stringByReplacingCharactersInRange:range withString:@"*"];
        startLocation ++;
    }
    
    return newStr;
}

@end
