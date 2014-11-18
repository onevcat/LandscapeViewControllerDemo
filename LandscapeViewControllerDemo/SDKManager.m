//
//  SDKManager.m
//  LandscapeViewControllerDemo
//
//  Created by Wang Wei on 2014/11/18.
//  Copyright (c) 2014年 Wang Wei. All rights reserved.
//

#import "SDKManager.h"
#import "SDKViewController.h"

@interface SDKManager()<SDKViewControllerDelegate>

@end

@implementation SDKManager

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
    
    [viewController presentViewController:sdkVc animated:YES completion:nil];
}

-(void)sdkViewControllerDismissButtonPressed:(SDKViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
