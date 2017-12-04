//
//  MXTypeDefine.h
//  XinAnDaApp
//
//  Created by Lucas on 2017/8/3.
//  Copyright © 2017年 bluemobi. All rights reserved.
//

#ifndef MXTypeDefine_h
#define MXTypeDefine_h

/**
 *	描述：充值操作状态类型 RechargeStateType
 */
typedef NS_ENUM(NSUInteger, RechargeStateType) {
    RechargeStateType_Success,  //充值成功
    RechargeStateType_Failure,  //充值失败
};


/**
 *	描述：销售状态类型 SaleStateType
 */
typedef NS_ENUM(NSUInteger, SaleStateType) {
    SaleStateType_OnSale,       //在售
    SaleStateType_SoldOut,      //售完
};


/**
 *	描述：转让状态类型 TransferStateType
 */
typedef NS_ENUM(NSUInteger, TransferStateType) {
    TransferStateType_Unknown,       //未知状态
    TransferStateType_InProgress,    //转让中
    TransferStateType_Done,          //已转让
};


/**
 *	描述：邮箱类型 MailBoxType
 */
typedef NS_ENUM(NSUInteger, MailBoxType) {
    MailBoxType_Unknown,        //未知类邮箱
    MailBoxType_QQ,             //QQ邮箱
    MailBoxType_163,            //163邮箱
    MailBoxType_126,            //126邮箱
    MailBoxType_WangYi,         //网易邮箱
    MailBoxType_Sina,           //新浪邮箱
    MailBoxType_Hotmail,        //hotmail邮箱
    MailBoxType_ALi,            //阿里邮箱
    MailBoxType_139,            //139邮箱
};

/**
 *	描述：视频捕捉类型 MXVideoCaptureType
 */
typedef NS_ENUM(NSUInteger, MXVideoCaptureType) {
    MXVideoCaptureType_Unknown,        //未知
    MXVideoCaptureType_TakePhoto,      //拍照
    MXVideoCaptureType_QRCode,         //二维码扫描
    MXVideoCaptureType_FaceDetection,  //人脸识别
};




#endif /* MXTypeDefine_h */
