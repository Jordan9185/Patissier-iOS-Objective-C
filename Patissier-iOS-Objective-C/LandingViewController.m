//
//  LandingViewController.m
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()

@property (strong, nonatomic) CAGradientLayer *backgroundGradientLayer;

@end

@implementation LandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBackgroundImageView];
    
    [self setUpBackgroundGradientView];
}

- (void)setUpBackgroundImageView {
    
    self.landingImageView.image = [UIImage imageNamed:@"image-landing.png"];
    
    //self.landingImageView.contentMode = [UIViewContentModeScaleAspectFill];
}

- (void)setUpBackgroundGradientView {
    
    
    
}

@end
