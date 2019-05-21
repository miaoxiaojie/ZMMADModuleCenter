//
//  ZMMADStartBaseModule.h
//  ZMMADModuleCenter
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMMADStartBaseModuleInterface.h"

NS_ASSUME_NONNULL_BEGIN


/**
 自定义AppDelegate启动module都需要继承该类实现
 */
@interface ZMMADStartBaseModule : NSObject<ZMMADStartBaseModuleInterface>

@end

NS_ASSUME_NONNULL_END
