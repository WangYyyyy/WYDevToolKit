//
//  WYStringChecker.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYStringChecker : NSObject
+ (BOOL)check123:(NSString *)str;

+ (BOOL)checkPhoneNum:(NSString *)str;

+ (BOOL)checkIDNum:(NSString *)str;

+ (BOOL)checkHAN_ABC_10:(NSString *)str;

+ (BOOL)checkHAN_ABC_19:(NSString *)str;

+ (BOOL)checkWithPattern:(NSString *)pattern str:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
