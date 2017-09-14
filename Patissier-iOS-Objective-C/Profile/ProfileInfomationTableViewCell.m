//
//  ProfileInfomationTableViewCell.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProfileInfomationTableViewCell.h"

@implementation ProfileInfomationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUpImageView {
    
    self.userImage.contentMode = UIViewContentModeScaleAspectFill;
}

@end
