//
//  User.m
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/13.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "User.h"
#import <AFNetworking.h>

@implementation User

- (NSString *) fullName {
    
    NSString *fullName = [NSString stringWithFormat: @"%@ %@",
                          self.firstName ,
                          self.lastName];
    
    return fullName;
}

- (NSURL *) imageUrl {
    
    NSString *urlString = [NSString stringWithFormat: @"http://52.198.40.72/patissier/users/%@/picture.jpg",
                           self.identifier];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    return url;
}

@end
