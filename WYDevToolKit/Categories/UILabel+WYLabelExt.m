//
//  UILabel+WYLabelExt.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "UILabel+WYLabelExt.h"

@implementation UILabel (WYLabelExt)
+ (UILabel *)labelWithText:(NSString * __nullable)text font:(UIFont *)font textColor:(UIColor *)color {
    
    UILabel *l = [UILabel new];
    l.text = text;
    l.font = font;
    l.textColor = color;
    return l;
}
@end
