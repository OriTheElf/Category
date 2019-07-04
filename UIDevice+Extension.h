//
//  UIDevice+Extension.h
//  DepositExpress
//
//  Created by Ori on 28/5/2019.
//  Copyright © 2019 caffmac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Extension)

/**
 判断设备是否有刘海
 */
@property (class, readonly) BOOL hasBang;

/**
 刘海屏HomeBar高度
 */
@property (class, readonly) CGFloat homeBarHeight;

/**
 状态栏高度
 */
@property (class, readonly) CGFloat statusBarHeight;

/**
 硬件平台名称，如 iPhone3,1、iPad7,4 等
 */
@property (class, readonly) NSString *platform;

/**
 设备型号名称，如 iPhone 7、iPhone X、iPad Pro 10.5-inch 等
 */
@property (class, readonly) NSString *platformString;

/**
 获取设备型号名称，与 platformString 一致，只查询一次然后缓存
 */
@property (class, readonly) NSString *deviceName;

@end

NS_ASSUME_NONNULL_END
