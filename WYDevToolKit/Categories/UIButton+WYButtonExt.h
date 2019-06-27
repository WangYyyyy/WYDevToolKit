//
//  UIButton+WYButtonExt.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/27.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (WYButtonExt)

+ (UIButton *)buttonWithImage:(UIImage *)image target:(id __nullable)target action:(SEL __nullable)action;

+ (UIButton *)buttonWithTarget:(id __nullable)target action:(SEL __nullable)action;

+ (UIButton *)buttonWithTitle:(NSString * __nullable)title titleColor:(UIColor * __nullable)color titleFont:(UIFont * __nullable)font image:(UIImage * __nullable)image target:(id __nullable)target action:(SEL __nullable)action;

/**
 调整btn内容的位置, 仅支持frame设置
 
 @param margin 间距
 */
- (void)setTitleLeftImageRight:(CGFloat)margin;

@end

NS_ASSUME_NONNULL_END
