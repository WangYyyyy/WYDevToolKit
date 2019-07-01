//
//  WYCommonMacros.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#ifndef WYCommonMacros_h
#define WYCommonMacros_h

//MARK: 通用高度
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height
#define NAV_BAR_HEIGHT      (IPHONEX ? 88.f : 64.f)
#define TABBAR_HEIGHT       (IPHONEX ? 83.f : 49.f)
#define SAFE_TOP_MARGIN     (IPHONEX ? 24.f : 0.f)
#define SAFE_BOTTOM_MARGIN  (IPHONEX ? 34.f : 0.f)
#define STATUSBAR_HEIGHT    (IPHONEX ? 44.f : 20.f)

//MARK: 系统相关
#define KEY_WINDOW      [UIApplication sharedApplication].keyWindow
#define DEVICE_UUID     [[[UIDevice currentDevice] identifierForVendor] UUIDString]

#define SYSTEM_VERSION  [UIDevice currentDevice].systemVersion.floatValue
#define iOS11           ([UIDevice currentDevice].systemVersion.floatValue >= 11.0)
#define iOS10           ([UIDevice currentDevice].systemVersion.floatValue >= 10.0)
#define iOS9            ([UIDevice currentDevice].systemVersion.floatValue >= 9.0)

#define IPHONE5         (SCREEN_HEIGHT == 568)
#define IPHONE6         (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 667)
#define IPHONE6P        (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 736)
#define IPHONEX         (SCREEN_HEIGHT == 812 || SCREEN_HEIGHT == 896)

//MARK: fonts
#define FONT(x)         iOS9?[UIFont fontWithName:@"PingFangSC-Regular" size:x]:[UIFont systemFontOfSize:x]
#define FONT_BOLD(x)    iOS9?[UIFont fontWithName:@"PingFangSC-Semibold" size:x]:[UIFont boldSystemFontOfSize:x]

//MARK: colors
#define RANDOM_COLOR        RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define CLEAR_COLOR         [UIColor clearColor]
#define COLOR_FFF           [UIColor whiteColor]
#define COLOR_000           [UIColor blackColor]
#define COLOR_333           RGB_HEX(0x333333)

#define RGB(r, g, b)            RGBA(r, g, b, 1)
#define RGBA(r, g, b, a)        [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define RGB_HEX(rgbValue)       RGBA_HEX(rgbValue, 1.0)
#define RGBA_HEX(rgbValue, a)   [UIColor \
                                colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

//MARK:logs
#ifdef DEBUG
#define NSLog(fmt, ...)      NSLog((fmt), ##__VA_ARGS__);
#else
#define NSLog(...)
#endif

//MARK: short cut
#define IMAGE(imageName)            [UIImage imageNamed:imageName]
#define URL(urlString)              [NSURL URLWithString:urlString]
#define UIColorHex(_hex_)           [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#define UIImageNamed(_name_)        [UIImage imageNamed:((__bridge NSString *)CFSTR(#_name_))]
#define NSURLString(_string_)       [NSURL URLWithString:((__bridge NSString *)CFSTR(#_string_))]
#define KEY_WINDOW                  [UIApplication sharedApplication].keyWindow
#define USER_DEFAULTS               [NSUserDefaults standardUserDefaults]
#define APP_DELEGATE                [UIApplication sharedApplication].delegate
//required  #import "AppDelegate.h"
#define APP_DELEGATE_PJ             ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define DEVICE_UUID                 [[[UIDevice currentDevice] identifierForVendor] UUIDString]

//MARK: border and radius
#define VIEW_BORDER_RADIUS(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#define VIEW_RADIUS(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

#define VIEW_BORDER(View, Width, Color)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]];\
[View.layer setMasksToBounds:YES]


#pragma mark - UI

#define K_iPhoneX            ([UIScreen mainScreen].bounds.size.height >= 812.0)

#define UI_SCREEN_WIDTH      ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT     ([[UIScreen mainScreen] bounds].size.height)
#define UI_STATUSBAR_HEIGHT  (K_iPhoneX ? 44.f : 20.f)
#define UI_NAVAGATION_HEIGHT (UI_STATUSBAR_HEIGHT + 44.f)
#define UI_TABBAR_HEIGHT     (K_iPhoneX ? (49.f + 34.f) : 49.f)
#define UI_AUTOFIT(x)        (UI_SCREEN_WIDTH / 375 * x)

#endif /* WYCommonMacros_h */
