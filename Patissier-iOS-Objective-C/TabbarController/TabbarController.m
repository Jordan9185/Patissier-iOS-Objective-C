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
    
    NSArray *childViewControllers = [NSArray arrayWithObjects:
                                     [self setUpProductNavigationController],
                                     [self setUpProfileNavigationController],
                                     nil];
    
    [self setViewControllers: childViewControllers animated: false];
    
}

-(UITabBarItem *)setUpProductCollectionViewControllerTabBarItem {
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]
                                initWithTitle: @"Store"
                                image: [UIImage imageNamed: @"icon-store"]
                                tag:0];
    
    return tabBarItem;
}

-(UITabBarItem *)setUpProfileTableViewControllerTabBarItem {
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]
                                initWithTitle: @"Profile"
                                image: [UIImage imageNamed: @"icon-profile"]
                                tag:0];
    
    return tabBarItem;
}

-(UINavigationController *)setUpProductNavigationController {
    
    UIStoryboard *productStoryBoard = [UIStoryboard
                                       storyboardWithName:@"Product"
                                       bundle:nil];
    
    UINavigationController *productNavigationController = [productStoryBoard instantiateViewControllerWithIdentifier:@"productNavigationController"];
    
    productNavigationController.tabBarItem = [self setUpProductCollectionViewControllerTabBarItem];
    
    ProductCollectionViewController *productCollectionViewController = [ProductCollectionViewController alloc];
    
    [productNavigationController.childViewControllers arrayByAddingObject: productCollectionViewController];
    
    return productNavigationController;
}

-(UINavigationController *)setUpProfileNavigationController {
    
    UIStoryboard *profileStoryBoard = [UIStoryboard
                                       storyboardWithName:@"Profile"
                                       bundle:nil];
    
    UINavigationController *profileNavigationController = [profileStoryBoard instantiateViewControllerWithIdentifier:@"profileNavigationController"];
    
    profileNavigationController.tabBarItem = [self setUpProfileTableViewControllerTabBarItem];
    
    ProfileTableViewController *profileTableViewController = [ProfileTableViewController alloc];
    
    [profileNavigationController.childViewControllers arrayByAddingObject: profileTableViewController];
    
    return profileNavigationController;
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
