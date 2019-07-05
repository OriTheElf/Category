//
//  NSNumber+Extension.m
//  DepositExpress
//
//  Created by Ori on 27/6/2019.
//  Copyright © 2019 Ori. All rights reserved.
//

#import "NSNumber+Extension.h"

@implementation NSNumber (Extension)

- (NSString *)groupedDecimalString {
    NSNumberFormatter *formatter = [self numberFormatter];
    return [formatter stringFromNumber:self];
}

- (NSString *)decimalString {
    NSNumberFormatter *formatter = [self numberFormatter];
    formatter.groupingSeparator = @"";
    return [formatter stringFromNumber:self];
}

- (NSNumberFormatter *)numberFormatter {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    return formatter;
}

@end
