//
//  UILabel+WYLabelExt.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (WYLabelExt)
+ (UILabel *)labelWithText:(NSString * __nullable)text font:(UIFont *)font textColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
