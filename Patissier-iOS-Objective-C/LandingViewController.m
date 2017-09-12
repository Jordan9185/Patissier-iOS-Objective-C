//
//  LandingViewController.m
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "LandingViewController.h"
#import "TabbarController.h"
#import "AppDelegate.h"

@interface LandingViewController ()

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBackgroundImageView];
    
    [self setUpBackgroundGradientView];
    
}

- (void)setUpBackgroundImageView {
    
    self.landingImageView.image = [UIImage imageNamed:@"image-landing.png"];
    
    self.landingImageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)setUpBackgroundGradientView {
    
    self.GradientView.alpha = 0.85;
    
    UIColor *colorOne = [UIColor colorWithRed: 3.0 / 255.0
                                        green: 63.0 / 255.0
                                         blue: 122.0 / 255.0
                                        alpha: 1.0];
    
    UIColor *colorTwo = [UIColor colorWithRed: 4.0 / 255.0
                                        green: 107.0 / 255.0
                                         blue: 149.0 / 255.0
                                        alpha: 1.0];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.colors = [NSArray arrayWithObjects:(id) colorOne.CGColor, colorTwo.CGColor, nil];
    
    gradientLayer.frame = self.view.frame;
    
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    [self.GradientView.layer insertSublayer: gradientLayer atIndex: 0];
    
}

- (IBAction)signInWithFacebook:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login
     logInWithReadPermissions:@[@"public_profile",@"email"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         
         if (error) {
             
             NSLog(@"Process error");
             
         } else if (result.isCancelled) {
             
             NSLog(@"Cancelled");
             
         } else {
             
             NSLog(@"Logged in");
             
             NSLog(@"%@", result.token);
            
             TabbarController *tabBarController = [TabbarController alloc];
             
             AppDelegate.sharedAppDelegate.window.rootViewController = tabBarController;
             
         }
         
     }];

}

@end
