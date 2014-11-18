//
//  SDKManager.h
//  LandscapeViewControllerDemo
//
//  Created by Wang Wei on 2014/11/18.
//  Copyright (c) 2014年 Wang Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDKManager : NSObject

+ (instancetype)shared;
- (void)openInViewController:(UIViewController *)viewController;
@end
