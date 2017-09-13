//
//  UserManager.m
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/13.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "UserManager.h"
#import <AFNetworking.h>
#import "User.h"

@implementation UserManager

- (void) getMeProfile {
    
    NSString *urlString = @"http://52.198.40.72/patissier/api/v1/me";
    
    NSURL *url = [[NSURL alloc] initWithString: urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    NSString *bearToken = [NSString stringWithFormat: @"Bearer %@",
                           [[NSUserDefaults standardUserDefaults] objectForKey: @"jsonWebToken"]];
    
    [request setHTTPMethod: @"GET"];
    
    [request setValue: bearToken forHTTPHeaderField: @"Authorization"];

    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        NSDictionary *data = responseObject[@"data"];

        NSString *identifier = data[@"id"];
        
        NSString *firstName = data[@"first_name"];
        
        NSString *lastName = data[@"last_name"];
        
        User *user = [[User alloc] init];
        
        user.identifier = identifier;
        
        user.firstName = firstName;
        
        user.lastName = lastName;
        
        [self.delegate managerDidGetUserProfile: user];
        
    }];
    
    [dataTask resume];

}

@end
