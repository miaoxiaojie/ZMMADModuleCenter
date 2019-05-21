//
//  ZMMADDBModule.m
//  ZMMADModuleCenter
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMADDBModule.h"
#import "AppDelegate.h"

@implementation ZMMADDBModule

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self p_copyFMDBAppDB];
    [self finished];
    return YES;
}
/**
 *  拷贝应用数据库文件
 */
- (void)p_copyFMDBAppDB
{
   
}

@end
