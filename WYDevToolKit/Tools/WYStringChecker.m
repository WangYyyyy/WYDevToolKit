//
//  WYStringChecker.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "WYStringChecker.h"

@implementation WYStringChecker

+ (BOOL)check123:(NSString *)str {
    NSString *pattern = @"^[0-9]+$";
    return [self baseCheck:pattern str:str];
}

+ (BOOL)checkPhoneNum:(NSString *)str {
    NSString *pattern = @"^1\\d{10}$";
    return [self baseCheck:pattern str:str];
}

+ (BOOL)checkIDNum:(NSString *)str {
    NSString *pattern = @"(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$)";
    return [self baseCheck:pattern str:str];
}

+ (BOOL)checkHAN_ABC_10:(NSString *)str {
    NSString *pattern = @"^[\u4e00-\u9fa5_a-zA-Z_]{1,19}";
    return [self baseCheck:pattern str:str];
}

+ (BOOL)checkHAN_ABC_19:(NSString *)str {
    NSString *pattern = @"^[\u4e00-\u9fa5_a-zA-Z_]{1,19}";
    return [self baseCheck:pattern str:str];
}

+ (BOOL)checkWithPattern:(NSString *)pattern str:(NSString *)str {
    return [self baseCheck:pattern str:str];
}

+ (BOOL)baseCheck:(NSString *)pattern str:(NSString *)str {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    return [pred evaluateWithObject:str];
}
@end
