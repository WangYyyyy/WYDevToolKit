//
//  UITextField+WYTextFieldExt.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "UITextField+WYTextFieldExt.h"

@implementation UITextField (WYTextFieldExt)
+ (UITextField *)textfieldWithFont:(UIFont *)font textColor:(UIColor *)color placeholder:(NSString * __nullable)placeholder {
    
    UITextField *t = [UITextField new];
    t.font = font;
    t.textColor = color;
    t.placeholder = placeholder;
    return t;
}
@end
