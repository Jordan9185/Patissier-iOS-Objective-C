//
//  ProfileContentFavoriteCollectionViewCell.h
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileContentFavoriteCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIView *productBottomView;
@property (weak, nonatomic) IBOutlet UIButton *productLikeButton;

@end
