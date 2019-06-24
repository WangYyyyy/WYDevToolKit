//
//  UITableView+WYTableViewExt.h
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (WYTableViewExt)
+ (UITableView *)tableViewWithDeleagteAndDatasouce:(id)dd registerCell:(Class)cell cellID:(NSString *)cellID rowHeight:(CGFloat)rowHeight estimatedRowHeight:(CGFloat)estimatedRowHeight;
@end

NS_ASSUME_NONNULL_END
