//
//  Product.m
//  Patissier-iOS-Objective-C
//
//  Created by Francis Tseng on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "Product.h"
#import <UIKit/UIKit.h>


@implementation Product

- (NSURL *) imageURL {

    NSString *urlString = [NSString stringWithFormat: @"http://52.198.40.72/patissier/products/%@/preview.jpg", self.identifier];

    return [NSURL URLWithString: urlString];

}

@end
