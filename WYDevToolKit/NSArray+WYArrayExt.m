//
//  NSArray+WYArrayExt.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "NSArray+WYArrayExt.h"

@implementation NSArray (WYArrayExt)

- (id __nullable)ObjectAvoidOutRangeAtIndex:(NSUInteger)index {
    if (index < self.count) {
        return [self objectAtIndex:index];
    }else {
        return nil;
    }
}

@end
