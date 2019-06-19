//
//  CALayer+XibConfiguration.m
//  DepositExpress
//
//  Created by Ori on 13/6/2019.
//  Copyright © 2019 caffmac. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)

@dynamic borderUIColor;
@dynamic shadowUIColor;

- (void)setBorderUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}
- (void)setShadowUIColor:(UIColor *)color {
    self.shadowColor = color.CGColor;
}
@end
