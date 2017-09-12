//
//  ProfileContentFavoriteCollectionViewController.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProfileContentFavoriteCollectionViewController.h"
#import "ProfileContentFavoriteCollectionViewCell.h"

@interface ProfileContentFavoriteCollectionViewController ()

@end

@implementation ProfileContentFavoriteCollectionViewController

//static NSString * const reuseIdentifier = @"ProfileContentFavoriteCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"=============== CollectionView");
    
    UINib *cellNib = [UINib nibWithNibName:@"ProfileContentFavoriteCollectionViewCell" bundle:nil];
    
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"ProfileContentFavoriteCollectionViewCell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ProfileContentFavoriteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileContentFavoriteCollectionViewCell" forIndexPath:indexPath];

    return cell;
}

@end
