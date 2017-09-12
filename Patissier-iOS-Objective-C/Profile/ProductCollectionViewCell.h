//
//  ProductCollectionViewCell.h
//  Patissier-iOS-Objective-C
//
//  Created by Francis Tseng on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *productLikeButton;
@property (weak, nonatomic) IBOutlet UIView *productBottomView;

@end
