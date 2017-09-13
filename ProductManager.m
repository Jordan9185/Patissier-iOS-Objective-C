//
//  ProductManager.m
//  Patissier-iOS-Objective-C
//
//  Created by Francis Tseng on 2017/9/13.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProductManager.h"
#import "Product.h"

@implementation ProductManager



- (void)fetchProducts {
    
    Product *product = [[Product alloc] init];
    
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    NSString *productURLString = @"http://52.198.40.72/patissier/api/v1/products";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString: productURLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: URL];
    
    [request setHTTPMethod: @"GET"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *jsonWebToken = [defaults valueForKey:@"jsonWebToken"];
    
    NSString *bearerToken = [NSString stringWithFormat:@"Bearer %@", jsonWebToken];
    
    [request setValue: bearerToken forHTTPHeaderField: @"Authorization"];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest: request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error != nil) {
            NSLog(@"Error: %@", error);
            return ;
        }
        
        //NSLog(@"%@", responseObject[@"data"]);

        for (NSMutableDictionary *productInDict in responseObject[@"data"]) {
            product.identifier = productInDict[@"id"];
            product.name = productInDict[@"name"];
            product.price = NSInteger productInDict[@"price"];
            
            double qq = productInDict[@"price"];
            
            product.price = qq;
            
            
            
            [products addObject: product];
            
        }
        
        [self.delegate didGet:products];
        
    }];
    
    [dataTask resume];
    
}

@end
