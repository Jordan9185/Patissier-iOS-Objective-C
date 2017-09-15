//
//  User.h
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/13.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *identifier;

@property (strong, nonatomic) NSString *firstName;

@property (strong, nonatomic) NSString *lastName;

- (NSString *) fullName;

- (NSURL *) imageUrl;

@end
