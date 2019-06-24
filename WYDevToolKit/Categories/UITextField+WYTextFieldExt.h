//
//  UITextField+WYTextFieldExt.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (WYTextFieldExt)
+ (UITextField *)textfieldWithFont:(UIFont *)font textColor:(UIColor *)color placeholder:(NSString * __nullable)placeholder;
@end

NS_ASSUME_NONNULL_END
