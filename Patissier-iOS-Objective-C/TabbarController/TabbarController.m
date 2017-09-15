//
//  TabbarController.m
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "TabbarController.h"
#import "NavigationController.h"
#import "ProductCollectionViewController.h"
#import "ProfileTableViewController.h"

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

- (UINavigationController *)setUpProductNavigationController {
    
    UIStoryboard *storyBoard = [UIStoryboard
                                storyboardWithName:@"Product"
                                bundle:nil];
    
    ProductCollectionViewController *productCollectionViewController = [storyBoard
                                                                instantiateViewControllerWithIdentifier:@"productCollectionViewController"];
    
    NavigationController *navigationController = [[NavigationController alloc] initWithTitle: @"Pâtissier"];
    
    navigationController.tabBarItem = [self setUpProductCollectionViewControllerTabBarItem];
    
    [navigationController setViewControllers: [NSArray arrayWithObject:productCollectionViewController] animated:YES];
    
    return navigationController;
}

- (UINavigationController *)setUpProfileNavigationController {
    
    UIStoryboard *storyBoard = [UIStoryboard
                                storyboardWithName:@"Profile"
                                bundle:nil];
    
    ProfileTableViewController *profileTableViewController = [storyBoard
                                                              instantiateViewControllerWithIdentifier:@"profileTableViewController"];
    
    NavigationController *navigationController = [[NavigationController alloc] initWithTitle: @"Profile"];
    
    navigationController.tabBarItem = [self setUpProfileTableViewControllerTabBarItem];
    
    [navigationController setViewControllers: [NSArray arrayWithObject:profileTableViewController] animated:YES];
    
    return navigationController;
}


- (UITabBarItem *)setUpProductCollectionViewControllerTabBarItem {
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]
                                initWithTitle: @"Store"
                                image: [UIImage imageNamed: @"icon-store"]
                                tag:0];
    
    return tabBarItem;
}

- (UITabBarItem *)setUpProfileTableViewControllerTabBarItem {
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]
                                initWithTitle: @"Profile"
                                image: [UIImage imageNamed: @"icon-profile"]
                                tag:0];
    
    return tabBarItem;
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
