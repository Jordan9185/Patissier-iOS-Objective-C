//
//  ProductCollectionViewController.m
//  Patissier-iOS-Objective-C
//
//  Created by Francis Tseng on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "ProductCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Product.h"

@interface ProductCollectionViewController() {
    
    Product *recievedProduct1;
    Product *recievedProduct2;
    
    //NSArray *recievedProducts;

    NSArray<__kindof Product *> *recievedProducts;
}

@end

@implementation ProductCollectionViewController

static NSString * const reuseIdentifier = @"ProductCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //recievedProducts = @[@"a", @"b", @"c"];
    
    recievedProduct1 = [[Product alloc] init];
    recievedProduct1.identifier = @"5947974173a7f08ded3e8269";
    recievedProduct1.name = @"巧克力杯子蛋糕";
    recievedProduct1.price = 120;
    
    recievedProduct2 = [[Product alloc] init];
    recievedProduct2.name = @"yeahi";
    recievedProduct2.identifier = @"5947974473a7f08ded3e826a";
    recievedProduct2.price = 75;
    
    NSNumber *test = @1;
    
    recievedProducts = [NSArray arrayWithObjects:
                        recievedProduct1,
                      recievedProduct2,
                     test, nil
                      ];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return recievedProducts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    Product *product = [recievedProducts objectAtIndex:indexPath.row];
    //Product *productTest =  [[recievedProducts objectAtIndex:indexPath.row] name];
    //productTest.name = @"123";
    
    if ([product isKindOfClass:[Product class]]) {
        
       cell.productNameLabel.text = product.name;
        cell.productPriceLabel.text = [NSString stringWithFormat:@"%ld", (long)product.price];
        
    }
    
    
//    Product *product = (Product *)[recievedProducts objectAtIndex:indexPath.row];
//    
//    if (product.name != nil) {
//        cell.productNameLabel.text = product.name;
//    }

//    NSString *productPrice = [[recievedProducts objectAtIndex:indexPath.row] price];
//    [cell.productPriceLabel text: [recievedProducts objectAtIndex:indexPath.row] price];
    
    //[cell.productImageView sd_setImageWithURL: [recievedProducts objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
