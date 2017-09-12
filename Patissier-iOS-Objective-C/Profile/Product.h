//
//  Product.h
//  Patissier-iOS-Objective-C
//
//  Created by Francis Tseng on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *identifier;

@property NSString *name;

@property NSInteger price;

- (NSURL *) imageURL;

@end
