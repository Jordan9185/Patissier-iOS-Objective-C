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

@property NSString *price;

- (NSURL *) imageURL;

- (UIImage *) image;

@end

/*
struct Product {
    
    // MARK: Property
    
    let id: ProductId
    
    let name: String
    
    let price: Double
    
    var previewImageURL: URL {
        
        let urlString = "http://52.198.40.72/patissier/products/\(id.rawValue)/preview.jpg"
        
        return URL(string: urlString)!
        
    }
*/
