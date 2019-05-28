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
@end

NS_ASSUME_NONNULL_END
