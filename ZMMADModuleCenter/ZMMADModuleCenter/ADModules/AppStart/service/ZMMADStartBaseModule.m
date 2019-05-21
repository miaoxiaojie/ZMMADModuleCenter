//
//  ZMMADStartBaseModule.m
//  ZMMADModuleCenter
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMADStartBaseModule.h"
#import "ZMMADStartApplicationCenter.h"

@implementation ZMMADStartBaseModule

- (void)finished
{
    ZMMADStartApplicationCenter *eventCenter = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [eventCenter removeFinishedModule:[self businessID]];
}

- (NSString *)businessID
{
    return NSStringFromClass([self class]);
}

@end
