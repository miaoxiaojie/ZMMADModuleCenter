//
//  ZMMADStartApplicationCenter.m
//  ZMMADModuleCenter
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "ZMMADStartApplicationCenter.h"
#import "ZMMADStartBaseModuleInterface.h"
#import "ZMMADStartModuleConfig.h"

@interface ZMMADStartApplicationCenter ()

/**
 *  module的容器
 */
@property (strong,nonatomic) NSMutableArray *modules;

@end

@implementation ZMMADStartApplicationCenter

+ (ZMMADStartApplicationCenter *)sharedAppEventCenter
{
    static dispatch_once_t once;
    static ZMMADStartApplicationCenter *center = nil;
    dispatch_once(&once, ^{
        center = [[ZMMADStartApplicationCenter alloc] init];
    });
    return center;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modules = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

- (BOOL)registedAllModules
{
    
    NSArray *configItems = [ZMMADStartModuleConfig getConfigInfo];
    
    for (NSDictionary *itemDict in configItems)
    {
        NSString *className = [itemDict objectForKey:@"className"];
        
        id<ZMMADStartBaseModuleInterface>module = [[NSClassFromString(className) alloc] init];
        if ([module conformsToProtocol:@protocol(ZMMADStartBaseModuleInterface)])
        {
            [self.modules addObject:module];
        }
    }
    
    return YES;
}

- (void)handleApplicationEvent:(NSString *)aSelName Complete:(void(^)(id module,SEL sel))complete
{
    
    [self.modules enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id<ZMMADStartBaseModuleInterface>module = obj;
        if ([module conformsToProtocol:@protocol(ZMMADStartBaseModuleInterface)])
        {
            SEL sel = NSSelectorFromString(aSelName);
            if ([module respondsToSelector:sel]) {
                
                if (complete) {
                    complete(module,sel);
                }
                
            }
        }
        
    }];
}


- (void)removeFinishedModule:(NSString *)businessID
{
    [self p_removeFinishedModule:businessID];
}


#pragma mark - Private Mothed
- (void)p_removeFinishedModule:(NSString *)businessID
{
    
    [self.modules enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([[obj businessID] isEqualToString:businessID]) {
            [self.modules removeObject:obj];
        }
        
    }];
}

@end
