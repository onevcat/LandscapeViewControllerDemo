//
//  AppDelegate.m
//  LandscapeViewControllerDemo
//
//  Created by Wang Wei on 2014/11/18.
//  Copyright (c) 2014年 Wang Wei. All rights reserved.
//

#import "AppDelegate.h"
#import "AppViewController.h"
#import "SDKManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [AppViewController new];
    [self.window makeKeyAndVisible];
    return YES;
}

-(NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if ([SDKManager shared].isShowing) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
