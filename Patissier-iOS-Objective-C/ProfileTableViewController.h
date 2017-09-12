//
//  ProfileTableViewController.h
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileContentFavoriteCollectionViewController.h"


@interface ProfileTableViewController : UITableViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

typedef enum {
    Profile = 0,
    Segment,
    Content,
    //	Leave this one last
    TableRow_COUNT
} TableViewComponent;

@end
