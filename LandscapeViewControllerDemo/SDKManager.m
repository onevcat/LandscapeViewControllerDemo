//
//  SDKManager.m
//  LandscapeViewControllerDemo
//
//  Created by Wang Wei on 2014/11/18.
//  Copyright (c) 2014年 Wang Wei. All rights reserved.
//

#import "SDKManager.h"
#import "SDKViewController.h"

#import <objc/runtime.h>

@interface SDKManager()<SDKViewControllerDelegate>
@property (nonatomic, assign) NSUInteger plistSupportedOrientation;
@end

@implementation SDKManager

-(NSUInteger) plistSupportedOrientation {
    if (_plistSupportedOrientation == 0) {
        NSArray *supported = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"UISupportedInterfaceOrientations"];
        [supported enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL *stop) {
            if ([string caseInsensitiveCompare:@"UIInterfaceOrientationPortrait"] == NSOrderedSame) {
                _plistSupportedOrientation |= UIInterfaceOrientationMaskPortrait;
                
            } else if ([string caseInsensitiveCompare:@"UIInterfaceOrientationPortraitUpsideDown"] == NSOrderedSame) {
                _plistSupportedOrientation |= UIInterfaceOrientationMaskPortraitUpsideDown;
                
            } else if ([string caseInsensitiveCompare:@"UIInterfaceOrientationLandscapeLeft"] == NSOrderedSame) {
                _plistSupportedOrientation |= UIInterfaceOrientationMaskLandscapeLeft;
                
            } else if ([string caseInsensitiveCompare:@"UIInterfaceOrientationLandscapeRight"] == NSOrderedSame) {
                _plistSupportedOrientation |= UIInterfaceOrientationMaskLandscapeRight;
                
            }
        }];
        
        // No orientation written in plist. It means all orientations are supported.
        if (_plistSupportedOrientation == 0) {
            _plistSupportedOrientation = NSUIntegerMax;
        }
    }
    return _plistSupportedOrientation;
}

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    static id _shared = nil;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
    });
    return _shared;
}

- (void)openInViewController:(UIViewController *)viewController {
    SDKViewController *sdkVc = [SDKViewController new];
    sdkVc.delegate = self;
    self.isShowing = YES;
    [viewController presentViewController:sdkVc animated:YES completion:nil];
}

-(void)sdkViewControllerDismissButtonPressed:(SDKViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:^{
        self.isShowing = NO;
    }];
}

-(NSUInteger)sdk_application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    if ([SDKManager shared].isShowing) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return [[SDKManager shared] sdk_application:application supportedInterfaceOrientationsForWindow:window];
    }
}

-(NSUInteger)sdk_default_application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return [[SDKManager shared] plistSupportedOrientation];
}

@end
