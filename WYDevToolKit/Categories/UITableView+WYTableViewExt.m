//
//  UITableView+WYTableViewExt.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "UITableView+WYTableViewExt.h"

@implementation UITableView (WYTableViewExt)
+ (UITableView *)tableViewWithDeleagteAndDatasouce:(id)dd registerCell:(Class)cell cellID:(NSString *)cellID rowHeight:(CGFloat)rowHeight estimatedRowHeight:(CGFloat)estimatedRowHeight {
    
    UITableView *t = [UITableView new];
    t.delegate = dd;
    t.dataSource = dd;
    [t registerClass:cell forCellReuseIdentifier:cellID];
    t.separatorStyle = UITableViewCellSeparatorStyleNone;
    t.rowHeight = rowHeight;
    t.estimatedRowHeight = estimatedRowHeight;
    
    return t;
}

@end
