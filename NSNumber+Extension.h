//
//  NSNumber+Extension.h
//  DepositExpress
//
//  Created by Ori on 27/6/2019.
//  Copyright © 2019 Ori. All rights reserved.
//
//  解决NSNumber.stringValue丢失精度的问题
//  出现BUG的条件必须是两位数，且带两位小数，类型还必须是float
//  两位数：十位必须是7、8、9；个位数随意
//  两位小数：个位数随意；十位数必须是0
//  来源:http://blog.wangruofeng007.com/blog/2017/10/14/nsnumberzhuan-nsstringdiu-jing-wen-ti/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Extension)

@property (nonatomic, readonly) NSString *decimalString;

@end

NS_ASSUME_NONNULL_END
