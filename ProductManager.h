//
//  ProductManager.h
//  Patissier-iOS-Objective-C
//
//  Created by Francis Tseng on 2017/9/13.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@protocol ProductDelegate <NSObject>

-(void)didGet: (NSMutableArray *)products;

@end

@interface ProductManager : NSObject

@property (weak, nonatomic) id<ProductDelegate> delegate;
-(void)fetchProducts;


@end
