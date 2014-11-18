//
//  SDKViewController.h
//  LandscapeViewControllerDemo
//
//  Created by Wang Wei on 2014/11/18.
//  Copyright (c) 2014年 Wang Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDKViewController;
@protocol SDKViewControllerDelegate <NSObject>

-(void) sdkViewControllerDismissButtonPressed:(SDKViewController *)viewController;

@end

@interface SDKViewController : UIViewController
@property (nonatomic, weak) id<SDKViewControllerDelegate> delegate;
@end
