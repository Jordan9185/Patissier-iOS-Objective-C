//
//  UserManager.h
//  Patissier-iOS-Objective-C
//
//  Created by JordanLin on 2017/9/13.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol UserManagerDelegate

- (void) managerDidGetUserProfile: (User *)user;

@end

@interface UserManager : NSObject

- (void) getMeProfile;

@property (weak, nonatomic) id <UserManagerDelegate> delegate;

@end
