//
//  ZMMADStartModuleConfig.h
//  ZMMADModuleCenter
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  类型名称key值
 */
extern NSString *const kLaunchModuleClassNameKey;

NS_ASSUME_NONNULL_BEGIN

@interface ZMMADStartModuleConfig : NSObject

/**
 *  获取启动数据
 *
 *  @return 数据
 */
+ (NSArray *)getConfigInfo;

@end

NS_ASSUME_NONNULL_END
