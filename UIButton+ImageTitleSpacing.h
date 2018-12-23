//
//  UIButton+ImageTitleSpacing.h
//  Intelligent_Fire
//
//  Created by 高磊 on 2016/12/19.
//  Copyright © 2016年 高磊. All rights reserved.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, GLButtonEdgeInsetsStyle) {
    GLButtonEdgeInsetsStyleTop,   // image在上，label在下
    GLButtonEdgeInsetsStyleLeft,  // image在左，label在右
    GLButtonEdgeInsetsStyleBottom,// image在下，label在上
    GLButtonEdgeInsetsStyleRight  // image在右，label在左
};


@interface UIButton (ImageTitleSpacing)


/**
 设置button的titleLabel和imageView的布局样式，及间距。（添加宽高约束：UILayoutPriorityRequired）
 
 @param style titleLabel和imageView的布局样式
 @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

/**
 设置button的titleLabel和imageView的布局样式，及间距。（可设置优先级）
 
 @param style titleLabel和imageView的布局样式
 @param space titleLabel和imageView的间距
 @param priority 宽高约束的优先级
 */
- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
                           sizePriority:(UILayoutPriority)priority;

/**
 设置button的titleLabel和imageView的布局样式，及间距
 
 @param style titleLabel和imageView的布局样式
 @param space titleLabel和imageView的间距
 @param constraintSize 是否添加宽高的约束?
 @param priority 宽高约束的优先级，constraintSize为YES时有效
 */
- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space
                         constraintSize:(BOOL)constraintSize
                           sizePriority:(UILayoutPriority)priority;

@end
