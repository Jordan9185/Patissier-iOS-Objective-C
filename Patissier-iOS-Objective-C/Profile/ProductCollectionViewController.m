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
#import <CoreData/CoreData.h>


@interface ProductCollectionViewController() {
    
    Product *recievedProduct1;
    Product *recievedProduct2;
    
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
                            test,
                            nil
                      ];

//    Take "jsonWebToken" in NSUserDefaults.
//
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    NSString *jsonWebToken = [defaults valueForKey:@"jsonWebToken"];
//    
//    NSLog(@"test: %@", jsonWebToken);

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return recievedProducts.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    Product *product = [recievedProducts objectAtIndex:indexPath.row];
    
    id receivedProduct = [recievedProducts objectAtIndex: indexPath.row];
    
    //Product *productTest =  [[recievedProducts objectAtIndex:indexPath.row] name];
    //productTest.name = @"123";
    
    if ([receivedProduct isKindOfClass:[Product class]]) {
        
        Product *product = (Product *)receivedProduct;
        
        cell.productNameLabel.text = product.name;
        
        cell.productPriceLabel.text = [NSString stringWithFormat:@"%ld", (long)product.price];
        
        cell.productLikeButton.tag = indexPath.row;
        
        [cell.productLikeButton addTarget:self action:@selector(addToFavorite:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.productImageView sd_setImageWithURL: product.imageURL];
        
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

-(void)addToFavorite:(UIButton*)sender
{

    id receivedProduct = [recievedProducts objectAtIndex: sender.tag];
    
    if ([receivedProduct isKindOfClass:[Product class]]) {
        
        Product *product = (Product *)receivedProduct;
        
        NSManagedObjectContext *context = [self managedObjectContext];
        
        // Create a new managed object
        NSManagedObject *newProduct = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
        [newProduct setValue:product.name forKey:@"name"];
        [newProduct setValue:product.identifier forKey:@"identifier"];
        [newProduct setValue:[NSString stringWithFormat:@"%ld", (long)product.price] forKey:@"price"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }

        NSLog(@"Save Context");
        
    }

}

- (NSManagedObjectContext *)managedObjectContext {
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
        
    }
    
    return context;
    
}


@end
