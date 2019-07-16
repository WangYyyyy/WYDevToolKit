//
//  UIImageView+WYImageViewExt.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/7/16.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "UIImageView+WYImageViewExt.h"

@implementation UIImageView (WYImageViewExt)

+ (UIImageView *)imageViewWithImage:(UIImage *)image {
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    return iv;
}

+ (UIImageView *)imageViewWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    UIImageView *iv = [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
    return iv;
}

@end
