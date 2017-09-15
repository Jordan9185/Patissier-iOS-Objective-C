//
//  AppDelegate.h
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "TabbarController.h"
#import "LandingViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *) sharedAppDelegate;

@end

