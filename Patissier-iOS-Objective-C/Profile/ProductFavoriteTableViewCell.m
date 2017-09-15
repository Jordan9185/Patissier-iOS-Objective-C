//
//  ProductFavoriteTableViewCell.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProductFavoriteTableViewCell.h"
#import "ProfileContentFavoriteCollectionViewCell.h"
#import <CoreData/CoreData.h>

@interface ProductFavoriteTableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong) NSMutableArray *products;

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

/*
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Product"];
    
    self.products = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
*/

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
    
    return cell;
}

#pragma mark - Core Data

- (NSManagedObjectContext *)managedObjectContext
{

    NSManagedObjectContext *context = nil;

    id delegate = [[UIApplication sharedApplication] delegate];

    if ([delegate performSelector:@selector(managedObjectContext)]) {
        
        context = [delegate managedObjectContext];
        
    }

    return context;

}

@end
