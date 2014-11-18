//
//  SDKViewController.m
//  LandscapeViewControllerDemo
//
//  Created by Wang Wei on 2014/11/18.
//  Copyright (c) 2014年 Wang Wei. All rights reserved.
//

#import "SDKViewController.h"

@interface SDKViewController ()

@end

@implementation SDKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 100, 50);
    button.center = CGPointMake(self.view.center.x, self.view.center.y + 20);
    [button setTitle:@"Dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismissClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) dismissClicked:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sdkViewControllerDismissButtonPressed:)]) {
        [self.delegate sdkViewControllerDismissButtonPressed:self];
    }
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

@end
