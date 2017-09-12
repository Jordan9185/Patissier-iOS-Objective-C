//
//  TabbarController.m
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "TabbarController.h"
#import "ProductCollectionViewController.h"
#import "ProfileTableViewController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpTabBar];
    
    UIStoryboard *productStoryBoard = [UIStoryboard storyboardWithName:@"Product" bundle:nil];
    
    UIStoryboard *profileStoryBoard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    
    ProductCollectionViewController *productCollectionViewController = [productStoryBoard instantiateViewControllerWithIdentifier:@"ProductCollectionViewController"];
    
    ProfileTableViewController *profileTableViewController = [profileStoryBoard instantiateViewControllerWithIdentifier:@"ProfileTableViewController"];
    
    NSArray *childViewControllers = [NSArray arrayWithObjects:
                                     productCollectionViewController,
                                     profileTableViewController,
                                     nil];
    
    self.viewControllers = childViewControllers;
    
}

- (void) setUpTabBar {
    
    self.tabBar.barStyle = UIBarStyleDefault;
    
    self.tabBar.translucent = false;
    
    self.tabBar.tintColor = [UIColor
                             colorWithRed: 53.0 / 255.0
                             green: 184.0 / 255.0
                             blue: 208.0 / 255.0
                             alpha: 1.0 ];
}

@end
