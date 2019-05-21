//
//  ZMMADStartModuleConfig.m
//  ZMMADModuleCenter
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMADStartModuleConfig.h"
#import "ZMMADDBModule.h"
#import "ZMMADBackgroundRunModule.h"
#import "ZMMADStartBaseModule.h"

NSString *const kLaunchModuleClassNameKey = @"className";
NSString *const kLaunchModuleJsonKey = @"configItems";

@implementation ZMMADStartModuleConfig

+ (NSArray *)getConfigInfo
{
    return @[@{kLaunchModuleClassNameKey:NSStringFromClass([ZMMADDBModule class])},//DB文件操作
             @{kLaunchModuleClassNameKey:NSStringFromClass([ZMMADBackgroundRunModule class])},//iOS向后台申请一段时间
             @{kLaunchModuleClassNameKey:NSStringFromClass([ZMMADStartBaseModule class])}//微信分享
             ];
    
}



@end
