//
//  NSArray+WYArrayExt.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (WYArrayExt)

/**
 防止数组越界的数组get方法
 
 @param index 下标
 @return 如果越界则返回nil对象
 */
- (id __nullable)ObjectAvoidOutRangeAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
