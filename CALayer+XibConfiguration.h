//
//  CALayer+XibConfiguration.h
//  DepositExpress
//
//  Created by Ori on 13/6/2019.
//  Copyright © 2019 caffmac. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (XibConfiguration)
@property(nonatomic) UIColor *borderUIColor;
@property(nonatomic) UIColor *shadowUIColor;
@end

NS_ASSUME_NONNULL_END
