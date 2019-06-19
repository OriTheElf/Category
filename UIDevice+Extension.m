//
//  UIDevice+Extension.m
//  DepositExpress
//
//  Created by Ori on 28/5/2019.
//  Copyright © 2019 caffmac. All rights reserved.
//

#import "UIDevice+Extension.h"

@implementation UIDevice (Extension)

/**
 判断设备是否有刘海

 @return 是否是刘海屏
 */
+ (BOOL)hasBang {
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom > 0.0;
    } else {
        return NO;
    }
}

+ (CGFloat)homeBarHeight {
    if (self.hasBang) {
        return 34.0;
    }
    return 0.0;
}

+ (CGFloat)statusBarHeight {
    return UIApplication.sharedApplication.statusBarFrame.size.height;
}
@end
