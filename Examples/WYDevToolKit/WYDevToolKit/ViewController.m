//
//  ViewController.m
//  WYDevToolKit
//
//  Created by wangyu on 2019/6/24.
//  Copyright © 2019 wangyu. All rights reserved.
//

#import "ViewController.h"
#import "WYDevToolKit.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *i = UIImageNamed(danshengou);
    NSLog(@"%@",i);
    
    NSDictionary *dict = @{
                           @"名字" : @"杰克",
                           @"年龄" : @20,
                           };
    NSLog(@"%@", dict);
    
    UIColorHex(#ffffff);
    
    
    APP_DELEGATE_PJ;
    
    // Do any additional setup after loading the view.
}


@end
