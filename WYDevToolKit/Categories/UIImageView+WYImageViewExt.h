//
//  UIImageView+WYImageViewExt.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/7/16.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (WYImageViewExt)

+ (UIImageView *)imageViewWithImage:(UIImage *)image;

+ (UIImageView *)imageViewWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;

@end

NS_ASSUME_NONNULL_END
