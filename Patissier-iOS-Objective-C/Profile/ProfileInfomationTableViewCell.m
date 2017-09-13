//
//  ProfileInfomationTableViewCell.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProfileInfomationTableViewCell.h"
#import "UserManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation ProfileInfomationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.manager = [UserManager alloc];
    
    [self setUpImageView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUpImageView {
    
    self.manager.delegate = self;
    
    [self.manager getMeProfile];
    
}

- (void) managerDidGetUserProfile: (User *)user {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.imageView sd_setImageWithURL: user.imageUrl];
        
    });
    
}

@end
