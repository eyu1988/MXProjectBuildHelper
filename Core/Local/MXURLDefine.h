//
//  MXURLDefine.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/25.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#ifndef MXURLDefine_h
#define MXURLDefine_h

#define URL(Key,Value) static NSString  * const Key = Value;


#pragma mark - 根路径

URL(NetworkBaseURLString,@"http://175.102.18.36:8095/financeApp/")      /**< 基本请求根路径 */

URL(NetworkImageURLString,@"http://175.102.18.36:8099/finance/")        /**< 图片上传请求根路径 */



#pragma mark - 理财

URL(MXURL_FINANCE_USERAUTH,@"rest/user/updateUserAuthentication.do")    /**< 身份认证 B1_1_1 */

URL(MXURL_FINANCE_UPDATEBANKINFO,@"rest/user/updateBank.do")            /**< 银行卡绑定 B1_1_2 && 更换银行卡 B1_1_8_4 && 借款申请添加银行卡 C1_1_5_2 */

URL(MXURL_FINANCE_UPDATETRADEPWD,@"rest/user/updateTransactionPwd.do")  /**< 交易密码 B1_1_3 && 重置密码 D1_1_3_5_3 */

URL(MXURL_FINANCE_FINDMSGLIST,@"message/findMessageList.do")            /**< 消息中心列表 B1_1_7 */

URL(MXURL_FINANCE_FINDMSGDETAIL,@"message/findMessageDetail.do")        /**< 消息详情(H5) B1_1_7_1 */

URL(MXURL_FINANCE_USERACCOUNTDETAIL,@"user/account/findUserAccountDetail.do")  /**< 金元宝投资页数据加载 B1_1_8 */

//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */
//
//URL(MXURL_FINANCE_,@"")  /**<  */



#pragma mark - 我的

URL(MXURL_MINE_MSGUNREADCOUNT,@"message/findUnreadMessage.do")          /**< 未读消息数（我的模块）*/

URL(MXURL_MINE_UPDATEUSERMOBILE,@"rest/user/updateUserMobile.do")       /**< 更新手机号 */

URL(MXURL_MINE_UPDATEUSERPWD,@"rest/user/updateUserPwd.do")             /**< 修改登录密码 */

URL(MXURL_MINE_UPDATETRADEPWD,@"rest/user/updateUserTransactionPwd.do") /**< 修改交易密码 */

URL(MXURL_MINE_SENDFORGOTCODE,@"rest/user/sendForgetCode.do")           /**< 短信验证(发送验证码) */

URL(MXURL_MINE_VERIFYFORGOTCODE,@"rest/user/verificationForgetCode.do") /**< 短信验证(验证) */

URL(MXURL_MINE_VERIFYIDCARD,@"rest/user/verificationPersonCard.do")     /**< 身份验证 */



#pragma mark - 注册

URL(MXURL_REGISTER,@"rest/user/register.do")                            /**< 注册 */

URL(MXURL_REGISTER_VALIDCODE,@"rest/user/valid/sendRegisterCode.do")    /**< 注册用验证码 - 后台没记录过的手机号*/



#pragma mark - 登录

URL(MXURL_LOGIN,@"rest/user/login.do")                                  /**< 登录 */

URL(MXURL_SENDCODE,@"rest/user/valid/sendCode.do")                      /**< 发送手机验证码 - 后台记录过的手机号 */

URL(MXURL_FINDPWD,@"rest/user/findPassWord.do")                         /**< 忘记密码 */



#pragma mark - 富文本

URL(MXURL_SYSTEM_FULLTEXT,@"systemFullText.do")                         /**< 富文本(H5) */



#endif /* MXURLDefine_h */
