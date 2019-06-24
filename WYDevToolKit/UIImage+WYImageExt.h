//
//  UIImage+WYImageExt.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WYImageExt)
/**
 调整image的orientation
 
 @return 调整为 UIImageOrientationUp
 */
- (UIImage *)fixOrientation;

/**
 压缩图片大小
 
 @param maxLength 单位b
 @return 压缩后的data格式
 */
- (NSData *)compressWithMaxLength:(NSUInteger)maxLength;
@end

NS_ASSUME_NONNULL_END
