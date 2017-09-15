//
//  ProductFavoriteTableViewCell.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProductFavoriteTableViewCell.h"
#import "ProfileContentFavoriteCollectionViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "Product.h"
#import "ProductManager.h"
#import <CoreData/CoreData.h>

@interface ProductFavoriteTableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ProductFavoriteTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"HIHI");
    // Initialization code
    
    UINib *cellNib = [UINib nibWithNibName:@"ProfileContentFavoriteCollectionViewCell" bundle:nil];
    
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"ProfileContentFavoriteCollectionViewCell"];

    self.collectionView.delegate = self;
    
    self.collectionView.dataSource = self;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return _products.count;

}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileContentFavoriteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileContentFavoriteCollectionViewCell" forIndexPath:indexPath];
    
    id receivedProduct = [self.products objectAtIndex: indexPath.row];

    //if ([receivedProduct isKindOfClass:[Product class]]) {
        
        Product *product = (Product *)receivedProduct;
        
        cell.productBottomView.layer.borderWidth = 0.5;
        
        cell.productBottomView.layer.borderColor = [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1].CGColor;
        
        cell.productNameLabel.text = product.name;
        
        cell.productPriceLabel.text = [[NSString alloc]initWithFormat:@"$ %@" , product.price];
        
        cell.productImageView.contentMode = UIViewContentModeScaleAspectFit;
    
        NSString *urlString = [NSString stringWithFormat: @"http://52.198.40.72/patissier/products/%@/preview.jpg", product.identifier];
    
        [cell.productImageView sd_setImageWithURL: urlString];
        
        cell.productLikeButton.tag = indexPath.row;
        
        //[cell.productLikeButton addTarget:self action:@selector(addToFavorite:) forControlEvents:UIControlEventTouchUpInside];
    //}

    return cell;
}


@end
