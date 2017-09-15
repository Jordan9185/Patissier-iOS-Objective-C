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
//#import <UIScrollView_InfiniteScroll/UIScrollView+InfiniteScroll.h>

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
        
        cell.productBottomView.layer.borderWidth = 0.5;
        
        cell.productBottomView.layer.borderColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1].CGColor;
        
        cell.productNameLabel.text = product.name;
        
        cell.productPriceLabel.text = [[NSString alloc]initWithFormat:@"$ %@" , product.price];

        cell.productImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [cell.productImageView sd_setImageWithURL: product.imageURL];
        
    }

    return cell;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView.contentOffset.y == scrollView.contentSize.height - scrollView.frame.size.height)
//    {
//        //LOAD MORE
//        // you can also add a isLoading bool value for better dealing :D
//        productManager = [ProductManager alloc];
//        
//        productManager.delegate = self;
//        
//        [productManager fetchProducts];
//    }
//}

@end
