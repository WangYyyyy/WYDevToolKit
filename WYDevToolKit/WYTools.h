//
//  WYTools.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WYCommonMacros.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYTools : NSObject


/**
 通过color获取image

 @param color color对象
 @return image对象
 */
+ (UIImage *)getImageWithColor:(UIColor *)color;


/**
 通过color获取image

 @param color color对象
 @param size image尺寸
 @return image对象
 */
+ (UIImage *)getImageWithColor:(UIColor *)color size:(CGSize)size;

/**
 通过约束计算view高度
 
 @param contentView 目标view (宽度为屏幕宽)
 @return 高度
 */
+ (CGFloat)getHeightFromViewWithConstraint:(UIView *)contentView;


/**
 通过约束计算view高度

 @param contentView 目标view
 @param width 指定宽度
 @return 高度
 */
+ (CGFloat)getHeightFromViewWithConstraint:(UIView *)contentView andWidth:(CGFloat)width;


/**
 系统alert

 @param string alert的文本
 */
+ (void)alertString:(NSString *)string;

/**
 获取文字宽度
 
 @param value 文字
 @param font 字体
 @return 宽度
 */
+ (CGFloat)widthForString:(NSString *)value andFont:(UIFont *)font;

/**
 获取设备名称
 
 @return e.g. iPad Air 2
 */
+ (NSString *)deviceModel;


/**
 旋转view

 @param view 目标view
 @param duration 一圈的持续时间
 */
+ (void)rotateViewBegin:(UIView *)view duration:(CFTimeInterval)duration;



/**
 停止旋转view

 @param view 目标view
 */
+ (void)rotateViewEnd:(UIView *)view;




@end

NS_ASSUME_NONNULL_END
