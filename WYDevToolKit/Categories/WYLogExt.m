//
//  WYLogExt.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

/*
 将字典（NSDictionary）和数组（NSArray）转化成JSON格式字符串输出到控制台。
 可以正常在控制台输出中文。
 直接将这个文件拖到工程中即可生效。
 */


//DEBUG模式生效
#ifdef DEBUG

#import "WYLogExt.h"
#import <objc/runtime.h>

#pragma mark - 方法交换

static inline void wy_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


#pragma mark - NSObject分类

@implementation NSObject (WYLogExt)
//将obj转换成json字符串。如果失败则返回nil.
- (NSString *)convertToJsonString {
    
    //先判断是否能转化为JSON格式
    if (![NSJSONSerialization isValidJSONObject:self])  return nil;
    NSError *error = nil;
    
    NSJSONWritingOptions jsonOptions = NSJSONWritingPrettyPrinted;
    if (@available(iOS 11.0, *)) {
        //11.0之后，可以将JSON按照key排列后输出，看起来会更舒服
        jsonOptions = NSJSONWritingPrettyPrinted | NSJSONWritingSortedKeys ;
    }
    //核心代码，字典转化为有格式输出的JSON字符串
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted  error:&error];
    if (error || !jsonData) return nil;
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
@end


#pragma mark - NSDictionary分类

@implementation NSDictionary (WYLogExt)

//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)printlog_descriptionWithLocale:(id)locale{
    
    NSString *result = [self convertToJsonString];//转换成JSON格式字符串
    if (!result) {
        result = [self printlog_descriptionWithLocale:locale];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *result = [self convertToJsonString];
    if (!result) {
        result = [self printlog_descriptionWithLocale:locale indent:level];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)printlog_debugDescription{
    
    NSString *result = [self convertToJsonString];
    if (!result) return [self printlog_debugDescription];
    return result;
}

//在load方法中完成方法交换
+ (void)load {
    
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        wy_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(printlog_descriptionWithLocale:));
        wy_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(printlog_descriptionWithLocale:indent:));
        wy_swizzleSelector(class, @selector(debugDescription), @selector(printlog_debugDescription));
    });
}

@end


#pragma mark - NSArray分类

@implementation NSArray (WYLogExt)

//用此方法交换系统的 descriptionWithLocale: 方法。该方法在代码打印的时候调用。
- (NSString *)printlog_descriptionWithLocale:(id)locale{
    
    NSString *result = [self convertToJsonString];//转换成JSON格式字符串
    if (!result) {
        result = [self printlog_descriptionWithLocale:locale];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 descriptionWithLocale:indent:方法。功能同上。
- (NSString *)printlog_descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    
    NSString *result = [self convertToJsonString];
    if (!result) {
        result = [self printlog_descriptionWithLocale:locale indent:level];//如果无法转换，就使用原先的格式
        return result;
    }
    return result;
}
//用此方法交换系统的 debugDescription 方法。该方法在控制台使用po打印的时候调用。
- (NSString *)printlog_debugDescription{
    
    NSString *result = [self convertToJsonString];
    if (!result) return [self printlog_debugDescription];
    return result;
}

//在load方法中完成方法交换
+ (void)load {
    
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        wy_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(printlog_descriptionWithLocale:));
        wy_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(printlog_descriptionWithLocale:indent:));
        wy_swizzleSelector(class, @selector(debugDescription), @selector(printlog_debugDescription));
    });
}

@end



#pragma mark - UIViewController分类 跟踪viewWillAppear函数

@implementation UIViewController (WYLogExt)

- (void)wy_tracker_viewWillAppear:(BOOL)animated {
    NSLog(@"\n🐕 %s\n✳️ Will Appear!", class_getName([self class]));
}

//在load方法中完成方法交换
+ (void)load {
    
    //方法交换
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        wy_swizzleSelector(class, @selector(viewWillAppear:), @selector(wy_tracker_viewWillAppear:));
    });
}

@end

#endif
