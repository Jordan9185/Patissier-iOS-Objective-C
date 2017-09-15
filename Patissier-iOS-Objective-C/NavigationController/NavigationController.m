//
//  NavigationController.m
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/15.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "NavigationController.h"

@implementation NavigationController

-(id)initWithTitle:(NSString *)title {
    self = [super init];
    
    self.title = title;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavigationBar: self.navigationBar title: self.title];
}

- (void) setUpNavigationBar: (UINavigationBar *)navigationBar title:(NSString *)title {
    
    NSShadow* shadow = [NSShadow new];
    
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
    
    shadow.shadowColor = [UIColor blackColor];
    
    navigationBar.titleTextAttributes = @{
                                          NSFontAttributeName : [UIFont fontWithName:@"Georgia-Bold" size:18],
                                          NSForegroundColorAttributeName : [UIColor whiteColor],
                                          NSShadowAttributeName: shadow
                                          };
    
    navigationBar.topItem.title = title;
    
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
    
    gradientLayer.frame = CGRectMake(0, -20, self.view.frame.size.width, navigationBar.frame.size.height + 20);
    
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    [navigationBar.layer insertSublayer: gradientLayer atIndex: 0];
}

@end
