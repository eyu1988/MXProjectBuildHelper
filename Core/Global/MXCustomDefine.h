//
//  MXCustomDefine.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#ifndef MXCustomDefine_h
#define MXCustomDefine_h
#import <CoreGraphics/CGBase.h>

/****************************
 *  描述: 控件字体大小统一设定   *
 *                           *
 *  @return CGFloat字号      *
 ****************************/

static const CGFloat FONTSIZE_CELL      = 14.5;     /**< 单行cell的字体 */
static const CGFloat FONTSIZE_CELLS     = 12;       /**< 多行cell的字体 */

static const CGFloat FONTSIZE_BTN_S     = 12;       /**< btn的小字体 */
static const CGFloat FONTSIZE_BTN_M     = 15;       /**< btn的中字体 */
static const CGFloat FONTSIZE_BTN_L     = 18;       /**< btn的大字体 */

static const CGFloat FONTSIZE_LABEL_S   = 12;       /**< label的小字体 */
static const CGFloat FONTSIZE_LABEL_M   = 15;       /**< label的中字体 */
static const CGFloat FONTSIZE_LABEL_L   = 21;       /**< label的中字体 */

static const CGFloat FONTSIZE_TFIELD_S  = 12;       /**< textField的小字体 */
static const CGFloat FONTSIZE_TFIELD_M  = 15;       /**< textField的中字体 */

static const CGFloat FONTSIZE_TVIEW_S   = 12;       /**< textView的小字体 */
static const CGFloat FONTSIZE_TVIEW_M   = 15;       /**< textView的中字体 */




/**************************
 *	描述: App自定义的主题色   *
 *                         *
 *	@return	UIColor对象    *
 **************************/

#define APP_COLOR_BLUE          kRGBAColor(36,139,241,1)    /**< 应用主题蓝 */
#define APP_COLOR_SEPARATOR     kRGBAColor(242,242,242,1)   /**< 分割线颜色 */
#define APP_COLOR_GRAY          [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1]   /**< 应用主题灰 */
#define APP_COLOR_BACKGROUND    [UIColor colorWithRed:0.97 green:0.98 blue:1 alpha:1]   /**< 背景颜色 */

#define FONT_COLOR_GRAY         [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1]   /**< 字体灰色 */
#define FONT_COLOR_YELLOW       [UIColor colorWithRed:1 green:0.97 blue:0.22 alpha:1]   /**< 字体黄色色 */
#define FONT_COLOR_LIGHTBLACK   kRGBAColor(102,102,102,1)   /**< 字体浅黑色 */
#define FONT_COLOR_BLACK        kRGBAColor(51,51,51,1)      /**< 字体浅黑色 */
#define FONT_COLOR_BLUE         [UIColor colorWithRed:0.12 green:0.47 blue:1 alpha:1]   /**< 字体蓝色 */
#define FONT_COLOR_PINK         [UIColor colorWithRed:1 green:0.47 blue:0.47 alpha:1]   /**< 字体粉色 */




/**************************
 *	描述: NSUserDefaults   *
 *                        *
 *	@return	key值         *
 **************************/
#define CONSTSTR(Key,Value) static NSString  * const Key = Value;

CONSTSTR(USERDEFAULTS_ISFIRSTSTART,@"isFirstStart")         /**< 首次安装启动 或 版本更新后首次启动 BOOL */
CONSTSTR(USERDEFAULTS_APPVERSION,@"appVersion")             /**< 首次安装启动 或 版本更新后首次启动 的 应用版本号记录 */
CONSTSTR(USERDEFAULTS_LASTLOGINUSERID,@"lastLoginUserId")   /**< 上一次有效登录的用户ID */
CONSTSTR(USERDEFAULTS_ISAUTOLOGIN,@"isAutoLogin")           /**< 是否为自动登录 BOOL */


//本地化宏
#define MXLocalizedStr(key)  NSLocalizedStringFromTable(key, @"InfoPlist", nil)


//测试Flag
#if DEBUG

#define APP_TEST_RUN  YES

#else

#define APP_TEST_RUN  NO

#endif


//屏蔽相机扫描银行卡
#define HIDE_FUNC_SCANBANK YES


#endif /* MXCustomDefine_h */
