//
//  UIViewController+WYViewControllerExt.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "UIViewController+WYViewControllerExt.h"
#import <objc/runtime.h>

@implementation UIViewController (WYViewControllerExt)


+ (void)load {
    Method originalWillAppearMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method swizzledWillAppearMethod = class_getInstanceMethod(self, @selector(wy_tracker_viewWillAppear:));
    method_exchangeImplementations(originalWillAppearMethod, swizzledWillAppearMethod);
}

- (void)wy_tracker_viewWillAppear:(BOOL)animated {
    //    [self wy_tracker_viewWillAppear:animated];
    NSLog(@"\n✳️ %s\n   Will Appear!", class_getName([self class]));
}

@end
