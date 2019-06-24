//
//  WYTools.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "WYTools.h"
#import <sys/utsname.h>

@implementation WYTools

+ (UIImage *)getImageWithColor:(UIColor *)color {
    
    return [self getImageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)getImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (CGFloat)getHeightFromViewWithConstraint:(UIView *)contentView {
    return [self getHeightFromViewWithConstraint:contentView andWidth:SCREEN_WIDTH];
}

+ (CGFloat)getHeightFromViewWithConstraint:(UIView *)contentView andWidth:(CGFloat)width {
    // 新建一个宽度约束
    NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    // 添加宽度约束
    [contentView addConstraint:widthFenceConstraint];
    // 获取约束后的size
    CGSize fittingSize = [contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    // 记得移除
    [contentView removeConstraint:widthFenceConstraint];
    return fittingSize.height;
}

+ (void)alertString:(NSString *)string {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:string preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [APP_DELEGATE.window.rootViewController presentViewController:alert animated:YES completion:nil];
}


+ (CGFloat)widthForString:(NSString *)value andFont:(UIFont *)font {
    
    CGFloat width = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, font.lineHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size.width;
    
    return width;
}

+ (NSString *)deviceModel {
    struct utsname systemInfo;
    uname(&systemInfo); // 获取系统设备信息
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    NSDictionary *dict = @{
                           // iPhone
                           @"iPhone5,3" : @"iPhone 5c",
                           @"iPhone5,4" : @"iPhone 5c",
                           @"iPhone6,1" : @"iPhone 5s",
                           @"iPhone6,2" : @"iPhone 5s",
                           @"iPhone7,1" : @"iPhone 6 Plus",
                           @"iPhone7,2" : @"iPhone 6",
                           @"iPhone8,1" : @"iPhone 6s",
                           @"iPhone8,2" : @"iPhone 6s Plus",
                           @"iPhone8,4" : @"iPhone SE",
                           @"iPhone9,1" : @"iPhone 7",
                           @"iPhone9,2" : @"iPhone 7 Plus",
                           @"iPhone10,1" : @"iPhone 8",
                           @"iPhone10,4" : @"iPhone 8",
                           @"iPhone10,2" : @"iPhone 8 Plus",
                           @"iPhone10,5" : @"iPhone 8 Plus",
                           @"iPhone10,3" : @"iPhone X",
                           @"iPhone10,6" : @"iPhone X",
                           @"iPhone11,2" : @"iPhone XS",
                           @"iPhone11,4" : @"iPhone XS Max",
                           @"iPhone11,6" : @"iPhone XS Max",
                           @"iPhone11,8" : @"iPhone XR",
                           @"i386" : @"iPhone Simulator",
                           @"x86_64" : @"iPhone Simulator",
                           // iPad
                           @"iPad4,1" : @"iPad Air",
                           @"iPad4,2" : @"iPad Air",
                           @"iPad4,3" : @"iPad Air",
                           @"iPad5,3" : @"iPad Air 2",
                           @"iPad5,4" : @"iPad Air 2",
                           @"iPad6,7" : @"iPad Pro 12.9",
                           @"iPad6,8" : @"iPad Pro 12.9",
                           @"iPad6,3" : @"iPad Pro 9.7",
                           @"iPad6,4" : @"iPad Pro 9.7",
                           @"iPad6,11" : @"iPad 5",
                           @"iPad6,12" : @"iPad 5",
                           @"iPad7,1" : @"iPad Pro 12.9 inch 2nd gen",
                           @"iPad7,2" : @"iPad Pro 12.9 inch 2nd gen",
                           @"iPad7,3" : @"iPad Pro 10.5",
                           @"iPad7,4" : @"iPad Pro 10.5",
                           @"iPad7,5" : @"iPad 6",
                           @"iPad7,6" : @"iPad 6",
                           // iPad mini
                           @"iPad2,5" : @"iPad mini",
                           @"iPad2,6" : @"iPad mini",
                           @"iPad2,7" : @"iPad mini",
                           @"iPad4,4" : @"iPad mini 2",
                           @"iPad4,5" : @"iPad mini 2",
                           @"iPad4,6" : @"iPad mini 2",
                           @"iPad4,7" : @"iPad mini 3",
                           @"iPad4,8" : @"iPad mini 3",
                           @"iPad4,9" : @"iPad mini 3",
                           @"iPad5,1" : @"iPad mini 4",
                           @"iPad5,2" : @"iPad mini 4",
                           // Apple Watch
                           @"Watch1,1" : @"Apple Watch",
                           @"Watch1,2" : @"Apple Watch",
                           @"Watch2,6" : @"Apple Watch Series 1",
                           @"Watch2,7" : @"Apple Watch Series 1",
                           @"Watch2,3" : @"Apple Watch Series 2",
                           @"Watch2,4" : @"Apple Watch Series 2",
                           @"Watch3,1" : @"Apple Watch Series 3",
                           @"Watch3,2" : @"Apple Watch Series 3",
                           @"Watch3,3" : @"Apple Watch Series 3",
                           @"Watch3,4" : @"Apple Watch Series 3",
                           @"Watch4,1" : @"Apple Watch Series 4",
                           @"Watch4,2" : @"Apple Watch Series 4",
                           @"Watch4,3" : @"Apple Watch Series 4",
                           @"Watch4,4" : @"Apple Watch Series 4"
                           };
    NSString *name = dict[platform];
    
    return name ? name : platform;
}


+ (void)rotateViewBegin:(UIView *)view duration:(CFTimeInterval)duration {
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = duration;
    rotationAnimation.repeatCount = HUGE_VALF;
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

+ (void)rotateViewEnd:(UIView *)view {
    [view.layer removeAllAnimations];
}

//MARK: date相关
+ (NSString *)getNowDateWithFormat:(NSString *)format {
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSString *)getNowDate {
    return [self getNowDateWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

+ (NSString *)randomStr:(int)count {
    
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < count; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    return string;
}

+ (NSString *)randomNameWithDate {
    NSString *result;
    NSString *timeSp = [NSString stringWithFormat:@"%lf", [[NSDate date] timeIntervalSince1970] * 1000];
    NSString *randomStr = [self randomStr:4];
    result = [NSString stringWithFormat:@"%@%@", timeSp, randomStr];
    return result;
}

@end
