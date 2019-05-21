//
//  AppDelegate.m
//  ZMMADModuleCenter
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "AppDelegate.h"
#import "ZMMADStartApplicationCenter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


+ (void)load
{
    //注册
    [[ZMMADStartApplicationCenter sharedAppEventCenter] registedAllModules];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ZMMADStartApplicationCenter *center = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"application:didFinishLaunchingWithOptions:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *,NSDictionary *) = (void *)imp;
        func(module,sel,application,launchOptions);
        
    }];
    
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    ZMMADStartApplicationCenter *center = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    ZMMADStartApplicationCenter *center = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
    
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    ZMMADStartApplicationCenter *center = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationWillEnterForeground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    ZMMADStartApplicationCenter *center = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    
    __block BOOL result = NO;
    ZMMADStartApplicationCenter *center = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *,NSURL *,NSDictionary<NSString*, id> *) = (void *)imp;
        func(module,sel,app,url,options);
        result = YES;
    }];
    return result;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    ZMMADStartApplicationCenter *center = [ZMMADStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}

@end
