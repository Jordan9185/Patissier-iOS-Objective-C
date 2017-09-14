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
#import "ProductManager.h"

@interface ProductCollectionViewController() {
    
    NSArray<__kindof Product *> *receivedProducts;
    
}

@end

@implementation ProductCollectionViewController

ProductManager *productManager;

static NSString * const reuseIdentifier = @"ProductCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    productManager = [ProductManager alloc];
    
    productManager.delegate = self;
    
    [productManager fetchProducts];

}

-(void)didGet:(NSMutableArray *)products {
    
    receivedProducts = products;
    
    [self.collectionView reloadData];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return receivedProducts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    id receivedProduct = [receivedProducts objectAtIndex: indexPath.row];
    
    if ([receivedProduct isKindOfClass:[Product class]]) {
        
        Product *product = (Product *)receivedProduct;
        
        cell.productNameLabel.text = product.name;
        
        cell.productPriceLabel.text = product.price.stringValue;
        NSLog(@"1231231231231  %@", product.price);
        [cell.productImageView sd_setImageWithURL: product.imageURL];
        
    }

    return cell;
}

@end
