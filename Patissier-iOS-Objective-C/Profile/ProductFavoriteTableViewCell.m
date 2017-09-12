//
//  ProductFavoriteTableViewCell.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProductFavoriteTableViewCell.h"
#import "ProfileContentFavoriteCollectionViewCell.h"

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
    return 8;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileContentFavoriteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileContentFavoriteCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}


@end
