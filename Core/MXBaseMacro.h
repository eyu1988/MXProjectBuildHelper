//
//  MXBaseMacro.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#ifndef MXBaseMacro_h
#define MXBaseMacro_h



//>>>>>>>>>>>>>>>>>>>> 获取系统对象 <<<<<<<<<<<<<<<<<<<<<
#pragma mark - 获取对象

#define kApplication          [UIApplication sharedApplication]
#define kAppWindow            [UIApplication sharedApplication].delegate.window
#define kAppDelegate          [AppDelegate shareAppDelegate]
#define kRootViewController   [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults         [NSUserDefaults standardUserDefaults]
#define kNotificationCenter   [NSNotificationCenter defaultCenter]



//>>>>>>>>>>>>>>>>>>>> 判定BOOL值 <<<<<<<<<<<<<<<<<<<<<
#pragma mark - 判定BOOL

//判空
#define IsNull(a)  (a==nil || a==NULL || (NSNull *)(a)==[NSNull null] || ((NSString *)a).length==0)


//数据验证
#define StrValid(f)             (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f)              (StrValid(f)?f:@"")
#define HasString(str,eky)      ([str rangeOfString:key].location!=NSNotFound)
#define ValidStr(f)             (StrValid(f) && f.length > 0)
#define ValidDict(f)            (f!=nil &&[f isKindOfClass:[NSDictionary class]])
#define ValidArray(f)           (f!=nil &&[f isKindOfClass:[NSArray class]]&&[f count]>0)
#define ValidNum(f)             (f!=nil &&[f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls)       (f!=nil &&[f isKindOfClass:[cls class]])
#define ValidData(f)            (f!=nil &&[f isKindOfClass:[NSData class]])


//判断是否为iPhone
#define IS_IPHONE    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为iPod
#define IS_IPOD    ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
//判断是否为iPhone 5(S)(E)
#define iPhone5SE   ( [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f)
//判断是否为iPhone 6/6s
#define iPhone6_6s    ([[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f)
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus    ([[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f)

//IOS版本判断
#define IOS_AVAILABLE_VERSION(version)    ([[UIDevice currentDevice] availableVersion:version]< 0)
//当前系统版本
#define CurrentSystemVersion    [[UIDevice currentDevice].systemVersion doubleValue]
//当前语言
#define CurrentLanguage    ([NSLocale preferredLanguages]objectAtIndex:0])

//IOS_VERSION_10_OR_LATER : iOS 10 以上版本检测
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#define IOS_VERSION_10_OR_LATER    (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_9_x_Max)
#else
#define IOS_VERSION_10_OR_LATER    NO
#endif

//IOS_VERSION_9_OR_LATER : iOS 9 以上版本检测
#ifdef NSFoundationVersionNumber_iOS_8_x_Max
#define IOS_VERSION_9_OR_LATER    (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_x_Max)
#else
#define IOS_VERSION_9_OR_LATER    NO
#endif

//IOS_VERSION_8_OR_LATER : iOS 8 以上版本检测
#ifdef NSFoundationVersionNumber_iOS_7_1
#define IOS_VERSION_8_OR_LATER    (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)
#else
#define IOS_VERSION_8_OR_LATER    NO
#endif

/***** Demo *****
 if (IOS_VERSION_10_OR_LATER) {
 NSLog(@"iOS10+");
 }
 else if (IOS_VERSION_9_OR_LATER) {
 NSLog(@"iOS9+");
 }
 else if (IOS_VERSION_8_OR_LATER) {
 NSLog(@"iOS8+");
 }
 ***** END *****/



//>>>>>>>>>>>>>>>>>>>> 获取系统值或对象 <<<<<<<<<<<<<<<<<<<<<
#pragma mark - 取值

//获取屏幕尺寸信息
#define kScreenBounds         ([UIScreen mainScreen].bounds)
#define Iphone6ScaleWidth     KScreenWidth/375.0
#define Iphone6ScaleHeight    KScreenHeight/667.0
//根据ip6的屏幕来拉伸
#define kRealValue(with)      ((with)*(KScreenWidth/375.0f))


//沙盒document路径
#define KDocumentDirectory    ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])
//沙盒cache路径
#define KCacheDirectory    ([NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0])
//沙盒temp路径
#define kTempDirectory    NSTemporaryDirectory()


//强弱引用
#define kWeakSelf(type)    __weak typeof(type)weak##type = type;
#define kStrongSelf(type)    __strong typeof(type)type = weak##type;


//获取一段时间间隔(连用)
#define kStartTime              CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime                NSLog(@"Time: %f",CFAbsoluteTimeGetCurrent() - start)


/*
 * 获取当前屏幕的宽高像素点
 * 在iOS7中UIScreen.mainScreen().bounds是固定不变的值，在iOS8中他的值是随横竖屏改变的
 * iOS8中增加了2个属性
 * - nativeBounds：屏幕像素，不随横竖平改变的！
 * - nativeScale：1(non Retina)/2(Retina)/3(Retina HD)
 */
#define KScreenWidth ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)

#define KScreenHeight ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)

#define kScreenSize ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)


/**
 *	获取视图宽度
 *
 *	@param 	view 	视图对象
 *
 *	@return	宽度
 */
#define kGetBoundsWidth(view) view.bounds.size.width

/**
 *	获取视图高度
 *
 *	@param 	view 	视图对象
 *
 *	@return	高度
 */
#define kGetBoundsHeight(view) view.bounds.size.height

/**
 *	获取视图原点横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点横坐标
 */
#define kGetFrameLeft(view) view.frame.origin.x

/**
 *	获取视图原点纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点纵坐标
 */
#define kGetFrameTop(view) view.frame.origin.y

/**
 *	获取视图右下角横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角横坐标
 */
#define kGetFrameRight(view) (kGetFrameLeft(view) + kGetBoundsWidth(view))

/**
 *	获取视图右下角纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角纵坐标
 */
#define kGetFrameBottom(view) (kGetFrameTop(view) + kGetBoundsHeight(view))


//>>>>>>>>>>>>>>>>>>>> 赋值宏 <<<<<<<<<<<<<<<<<<<<<
#pragma mark - 赋值

//颜色
#define KClearColor                     [UIColor clearColor]
#define KWhiteColor                     [UIColor whiteColor]
#define KBlackColor                     [UIColor blackColor]
#define KGrayColor                      [UIColor grayColor]
#define KLightGrayColor                 [UIColor lightGrayColor]
#define KBlueColor                      [UIColor blueColor]
#define KRedColor                       [UIColor redColor]
//随机色生成
#define kRandomColor                    KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
//快速设置颜色
#define kRGBAColor(r,g,b,a)             ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
//字体颜色16进制0x
#define kColorWith0xColor(rgbValue)     [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//字体
#define FONT_BOLD_SYSTEM(FONTSIZE)      [UIFont boldSystemFontOfSize:FONTSIZE]
#define FONT_SYSTEM(FONTSIZE)           [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME,FONTSIZE)             [UIFont fontWithName:(NAME)size:(FONTSIZE)]


//定义UIImage对象
#define ImageWithFile(_pointer)         [UIImage imageWithContentsOfFile:([[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@@%dx",_pointer,(int)[UIScreen mainScreen].nativeScale]ofType:@"png"])]
#define IMAGE_NAMED(name)               [UIImage imageNamed:name]


//拼接字符串
#define NSStringFormat(format,...)    [NSString stringWithFormat:format,##__VA_ARGS__]



//>>>>>>>>>>>>>>>>>>>> 属性简写 <<<<<<<<<<<<<<<<<<<<<
#pragma mark - 属性简写

//property属性快速声明
#define PropertyString(s)          @property(nonatomic,copy)NSString * s
#define PropertyNSInteger(s)       @property(nonatomic,assign)NSInteger s
#define PropertyFloat(s)           @property(nonatomic,assign)float s
#define PropertyLongLong(s)        @property(nonatomic,assign)long long s
#define PropertyNSDictionary(s)    @property(nonatomic,strong)NSDictionary * s
#define PropertyNSArray(s)         @property(nonatomic,strong)NSArray * s
#define PropertyNSMutableArray(s)  @property(nonatomic,strong)NSMutableArray * s



//>>>>>>>>>>>>>>>>>>>> 方法简写 <<<<<<<<<<<<<<<<<<<<<
#pragma mark - 方法简写

//View圆角和加边框(注意无空行)
#define ViewBorderRadius(View,Radius,Width,Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]



// View圆角(注意无空行)
#define ViewRadius(View,Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


//GCD - 全局线程异步执行任务
#define kDISPATCH_ASYNC_BLOCK(block)    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),block)
//GCD - 主线程异步执行任务
#define kDISPATCH_MAIN_BLOCK(block)     dispatch_async(dispatch_get_main_queue(),block)
//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken;dispatch_once(&onceToken,onceBlock);



//单例化一个类(注意无空行)
#define SINGLETON_FOR_REFER(className)  [className shared##className]

#define SINGLETON_FOR_HEADER(className)\
\
+(className *)shared##className;


#define SINGLETON_FOR_CLASS(className)\
\
+(className *)shared##className { \
static className *shared##className = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken,^{ \
shared##className =[[self alloc]init];\
});\
return shared##className;\
}


//替换控制台打印日志的格式(DEBUG模式下，0或1使用不同格式打印；注意无空行)
#if DEBUG
#ifndef NSLog
#if (1)
#define NSLog(format, args...) \
NSLog(@"\n[%s:%d行]: " format "\n\n", strrchr(__FILE__, '/') + 1, __LINE__, ## args)
#else
#define NSLog(FORMAT, ...)  \
fprintf(stderr,"[%s:%d行] %s\n", [[[NSString stringWithUTF8String:__FILE__]lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT,##__VA_ARGS__]UTF8String]);
#endif
#endif
#else
#ifndef NSLog
#define NSLog(format, args...) do {} while(0)
#endif
#endif


//打印当前方法名
#define PRINT_METHOD_NAME()    NSLog(@"%s",__PRETTY_FUNCTION__)




#endif /* MXBaseMacro_h */
