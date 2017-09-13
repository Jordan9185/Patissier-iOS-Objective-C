//
//  ProductManager.m
//  Patissier-iOS-Objective-C
//
//  Created by Francis Tseng on 2017/9/13.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProductManager.h"

@implementation ProductManager

- (void)fetchProducts {
    
    NSString *productURLString = @"http://52.198.40.72/patissier/api/v1/products";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString: productURLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: URL];
    
    [request setHTTPMethod: @"GET"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *jsonWebToken = [defaults valueForKey:@"jsonWebToken"];
    
    NSString *bearerToken = [NSString stringWithFormat:@"Bearer %@", jsonWebToken];
    
    NSLog(bearerToken);
    
    [request setValue: bearerToken forHTTPHeaderField: @"Authorization"];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest: request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@", error);
            return ;
        }
        
        NSLog(@" %@", responseObject);
        
    }];
    
    [dataTask resume];
    
}

@end
