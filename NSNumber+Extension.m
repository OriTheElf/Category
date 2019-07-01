//
//  NSNumber+Extension.m
//  DepositExpress
//
//  Created by Ori on 27/6/2019.
//  Copyright © 2019 Ori. All rights reserved.
//

#import "NSNumber+Extension.h"

@implementation NSNumber (Extension)

- (NSString *)decimalString {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @"";
    return [formatter stringFromNumber:self];
}

@end
