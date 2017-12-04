//
//  MXUIFactory.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MXUIFactory : NSObject

/**
 *  描述: 创建导航栏按钮
 *
 *  @param frame        尺寸
 *  @param aImageName   按钮图片名称
 *  @param aTitle       按钮标题
 *  @param aColor       按钮标题颜色
 *  @param aFont        按钮标题字体
 *  @param aTarget      响应事件的目标
 *  @param aMethod      响应事件action
 *
 *  @return 导航栏按钮对象
 */
+ (UIBarButtonItem *)makeBarButtonItem:(CGRect)frame
                             imageName:(NSString *)aImageName
                                 title:(NSString*)aTitle
                             textColor:(UIColor *)aColor
                              textFont:(UIFont *)aFont
                                target:(id)aTarget
                                action:(SEL)aMethod;


/**
 *  描述: 创建一个button
 *
 *  @param frame        尺寸
 *  @param aImageName   按钮图片名称
 *  @param aTitle       按钮标题
 *  @param aColor       按钮标题颜色
 *  @param aFont        按钮标题颜色
 *  @param aBackColor   按钮背景颜色
 *  @param aTarget      响应事件的目标
 *  @param aMethod      响应事件action
 *
 *  @return 按钮对象
 */
+ (UIButton *)makeButton:(CGRect)frame
               imageName:(NSString*)aImageName
                   title:(NSString*)aTitle
               textColor:(UIColor *)aColor
                textFont:(UIFont *)aFont
               backColor:(UIColor*)aBackColor
                  target:(id)aTarget
                  action:(SEL)aMethod;


/**
 *  描述: 创建一个ImageView
 *
 *  @param frame        尺寸
 *  @param aImageName   imageview图片名称
 *
 *  @return imageview对象
 */
+ (UIImageView *)makeImageView:(CGRect)frame
                     imageName:(NSString*)aImageName;


/**
 *  描述: 创建一个label
 *
 *  @param frame            尺寸
 *  @param aText            label文本内容
 *  @param aColor           label文本颜色
 *  @param aFont            label文本字体
 *  @param aBackColor       label背景颜色
 *  @param aTextAlignment   文字对齐方式
 *
 *  @return label对象
 */
+ (UILabel*)makeLabel:(CGRect)frame
                 text:(NSString*)aText
            textColor:(UIColor*)aColor
                 font:(UIFont *)aFont
            backColor:(UIColor*)aBackColor
            alignment:(NSTextAlignment)aTextAlignment;


/**
 *  描述: 创建一个带背景图片或颜色背景的UIView
 *
 *  @param frame            尺寸
 *  @param aImageName       图片名称
 *  @param aColor           背景颜色
 *
 *  @return view对象
 */
+ (UIView*)makeView:(CGRect)frame
          imageName:(NSString*)aImageName
          backColor:(UIColor*)aColor;


/**
 *  描述: 创建一个输入框textField
 *
 *  @param frame            尺寸
 *  @param color            输入文字的颜色
 *  @param font             输入文字的字体
 *  @param placeHolder      预显示文本内容
 *  @param keyBoard         输入键盘类型
 *  @param clearBtnMode     清理按钮模式
 *  @param tDelegate        代理
 *
 *  @return textField对象
 */
+ (UITextField *)makeTextField:(CGRect)frame
                     textColor:(UIColor *)color
                      textFont:(UIFont *)font
                    textHolder:(NSString *)placeHolder
                  keyBoardType:(UIKeyboardType)keyBoard
                      clearBtn:(UITextFieldViewMode)clearBtnMode
             textFieldDelegate:(id<UITextFieldDelegate>)tDelegate;


/**
 *  描述: 创建一个textView
 *
 *  @param frame            尺寸
 *  @param color            输入文字的颜色
 *  @param font             输入文字的字体
 *  @param tDelegate        代理
 *
 *  @return textField对象
 */
+ (UITextView *)makeTextView:(CGRect)frame
                   textColor:(UIColor *)color
                    textFont:(UIFont *)font
                    delegate:(id<UITextViewDelegate>)tDelegate;



@end
