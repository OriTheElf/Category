//
//  UIButton+ImageTitleSpacing.m
//  Intelligent_Fire
//
//  Created by 高磊 on 2016/12/19.
//  Copyright © 2016年 高磊. All rights reserved.
//

#import "UIButton+ImageTitleSpacing.h"
#import <objc/runtime.h>

#define buttonHeightConstraint @"buttonHeightConstraint"
#define buttonWidthtConstraint @"buttonWidthtConstraint"

@implementation UIButton (ImageTitleSpacing)

- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
                         constraintSize:(BOOL)constraintSize {
    /**
     *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    CGFloat titleWidth = 0.0;
    CGFloat titleHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
    // 由于iOS8中titleLabel的size为0，用下面的这种设置
        titleWidth = self.titleLabel.intrinsicContentSize.width;
        titleHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        titleWidth = self.titleLabel.frame.size.width;
        titleHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值

    switch (style) {
        case GLButtonEdgeInsetsStyleTop:
        {            
            imageEdgeInsets = UIEdgeInsetsMake(-titleHeight-space, 0, 0, -titleWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space, 0);
        }
            break;
        case GLButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case GLButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -titleHeight-space, -titleWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space, -imageWith, 0, 0);
        }
            break;
        case GLButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth+space/2.0, 0, -titleWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    
    // 5. 求得 新宽高
    CGFloat buttonHeight = 0.0;
    CGFloat buttonWidth = 0.0;
    switch (style) {
        case GLButtonEdgeInsetsStyleTop:
        case GLButtonEdgeInsetsStyleBottom:
            buttonHeight = imageHeight + space + titleHeight;
            buttonWidth = MAX(imageWith, titleWidth);
            break;
        case GLButtonEdgeInsetsStyleLeft:
        case GLButtonEdgeInsetsStyleRight:
            buttonHeight = MAX(imageHeight, titleHeight);
            buttonWidth = imageWith + space + titleWidth;
            break;
        default:
            break;
    }
    
    // 6. 添加宽高约束
    if (constraintSize) {
        NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:nil attribute:NSLayoutAttributeHeight
                                                                           multiplier:1.0 constant:buttonHeight];
        NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil attribute:NSLayoutAttributeWidth
                                                                          multiplier:1.0 constant:buttonWidth];
        heightConstraint.priority = UILayoutPriorityDefaultHigh;
        widthConstraint.priority = UILayoutPriorityDefaultHigh;
      
        NSLayoutConstraint *oldHeight = objc_getAssociatedObject(self, buttonHeightConstraint);
        if (oldHeight) {
            [self removeConstraint:oldHeight];
        }
        [self addConstraint:heightConstraint];
        objc_setAssociatedObject(self, buttonHeightConstraint, heightConstraint, OBJC_ASSOCIATION_RETAIN);
        
        NSLayoutConstraint *oldWidth = objc_getAssociatedObject(self, buttonWidthtConstraint);
        if (oldWidth) {
            [self removeConstraint:oldWidth];
        }
        [self addConstraint:widthConstraint];
        objc_setAssociatedObject(self, buttonWidthtConstraint, widthConstraint, OBJC_ASSOCIATION_RETAIN);
    }
}

@end
