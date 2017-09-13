//
//  ProfileInfomationTableViewCell.h
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserManager.h"

@interface ProfileInfomationTableViewCell : UITableViewCell <UserManagerDelegate>

@property (strong , nonatomic) UserManager *manager;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *name;

@end
