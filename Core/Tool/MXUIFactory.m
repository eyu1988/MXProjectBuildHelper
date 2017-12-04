//
//  MXUIFactory.m
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#import "MXUIFactory.h"

@implementation MXUIFactory

//barbutton
+ (UIBarButtonItem *)makeBarButtonItem:(CGRect)frame
                             imageName:(NSString *)aImageName
                                 title:(NSString*)aTitle
                             textColor:(UIColor *)aColor
                              textFont:(UIFont *)aFont
                                target:(id)aTarget
                                action:(SEL)aMethod
{
    UIButton * btn =  [self makeButton:frame imageName:aImageName title:aTitle textColor:aColor textFont:aFont backColor:nil target:aTarget action:aMethod];
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return barBtn;
}

//button
+ (UIButton *)makeButton:(CGRect)frame
               imageName:(NSString*)aImageName
                   title:(NSString*)aTitle
               textColor:(UIColor *)aColor
                textFont:(UIFont *)aFont
               backColor:(UIColor*)aBackColor
                  target:(id)aTarget
                  action:(SEL)aMethod
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame ;
    if (aImageName) {
        [btn setImage:[UIImage imageNamed:aImageName] forState:UIControlStateNormal];
    }
    if (aTitle) {
        [btn setTitle:aTitle forState:UIControlStateNormal];
    }
    if (aColor) {
        [btn setTitleColor:aColor forState:UIControlStateNormal];
    }
    btn.titleLabel.font = aFont ?:FONT_SYSTEM(FONTSIZE_BTN_M);
    if (aBackColor) {
        btn.backgroundColor = aBackColor;
    }
    if (aTarget) {
        [btn addTarget:aTarget action:aMethod forControlEvents:UIControlEventTouchUpInside];
    }
    
    return  btn;
}

//imageView
+ (UIImageView *)makeImageView:(CGRect)frame
                     imageName:(NSString*)aImageName
{
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
    [imageView setImage:IMAGE_NAMED(aImageName)];
    
    return imageView;
}

//label
+ (UILabel *)makeLabel:(CGRect)frame
                  text:(NSString*)aText
             textColor:(UIColor*)aColor
                  font:(UIFont *)aFont
             backColor:(UIColor*)aBackColor
             alignment:(NSTextAlignment)aTextAlignment
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = aText;
    label.textColor = aColor?:KBlackColor;
    label.font = aFont?:FONT_SYSTEM(FONTSIZE_LABEL_M);
    label.backgroundColor = aBackColor?:KClearColor;
    label.textAlignment = aTextAlignment;
    
    return label;
}

//背景view
+ (UIView*)makeView:(CGRect)frame
          imageName:(NSString*)aImageName
          backColor:(UIColor*)aColor
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = aColor?:KClearColor;
    if (aImageName) {
        UIImageView *imageView = [self makeImageView:CGRectMake(0, 0, frame.size.width, frame.size.height) imageName:aImageName];
        [view addSubview:imageView];
    }
    
    return view;
}

//textField
+ (UITextField *)makeTextField:(CGRect)frame
                     textColor:(UIColor *)color
                      textFont:(UIFont *)font
                    textHolder:(NSString *)placeHolder
                  keyBoardType:(UIKeyboardType)keyBoard
                      clearBtn:(UITextFieldViewMode)clearBtnMode
             textFieldDelegate:(id<UITextFieldDelegate>)tDelegate;
{
    UITextField *text = [[UITextField alloc] initWithFrame:frame];
    text.textColor = color?:KBlackColor;
    text.font = font?:FONT_SYSTEM(FONTSIZE_TFIELD_M);
    text.placeholder = placeHolder;
    text.borderStyle = UITextBorderStyleNone;
    text.keyboardType = keyBoard;
    text.clearButtonMode = clearBtnMode;
//    text.textAlignment = NSTextAlignmentCenter;
//    text.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    text.returnKeyType = UIReturnKeyDone;
    text.delegate = tDelegate;
    return text;
}

//textView
+ (UITextView *)makeTextView:(CGRect)frame
                   textColor:(UIColor *)color
                    textFont:(UIFont *)font
                    delegate:(id<UITextViewDelegate>)tDelegate
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.delegate = tDelegate;
    textView.textColor = color?:KBlackColor;
    textView.font = font?:FONT_SYSTEM(FONTSIZE_TVIEW_M);
    textView.showsHorizontalScrollIndicator = NO;
    textView.showsVerticalScrollIndicator = NO;
    return textView;
}

@end
