//
//  NSNumber+Extension.h
//  DepositExpress
//
//  Created by Ori on 27/6/2019.
//  Copyright © 2019 Ori. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Extension)

/**
 返回带分隔符的小数字符串 e.g.  123456->123,456
 */
@property (nonatomic, readonly) NSString *groupedDecimalString;

/**
 返回纯数字的小数字符串. e.g.  123.4560->123.456
 */
@property (nonatomic, readonly) NSString *decimalString;

@end

NS_ASSUME_NONNULL_END
