//
//  ProfileTableViewController.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/11.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "ProfileInfomationTableViewCell.h"
#import "ProfileSegmentedControlTableViewCell.h"
#import "ProfileContentFavoriteTableViewCell.h"
#import "ProfileContentFavoriteCollectionViewController.h"
#import "ProfileContentFavoriteCollectionViewCell.h"
#import "ProfilePurchaseTableViewCell.h"
#import "ProductFavoriteTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ProfileTableViewController ()

@property (nonatomic, assign) BOOL favoriteSegmentClicked;

@property (nonatomic, strong) User *currentUser;
@end

@implementation ProfileTableViewController

@synthesize favoriteSegmentClicked = _favoriteSegmentClicked;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.scrollEnabled = NO;

    UINib *cellNib = [UINib nibWithNibName:@"ProfileInfomationTableViewCell" bundle:nil];

    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"ProfileInfomationTableViewCell"];

    UINib *cellNib2 = [UINib nibWithNibName:@"ProfileSegmentedControlTableViewCell" bundle:nil];

    [self.tableView registerNib:cellNib2 forCellReuseIdentifier:@"ProfileSegmentedControlTableViewCell"];

    UINib *cellNib3 = [UINib nibWithNibName:@"ProfileContentFavoriteTableViewCell" bundle:nil];

    [self.tableView registerNib:cellNib3 forCellReuseIdentifier:@"ProfileContentFavoriteTableViewCell"];

    self.favoriteSegmentClicked = YES;



    self.userManager = [UserManager alloc];

    self.userManager.delegate = self;

    [self.userManager getMeProfile];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return TableRow_COUNT;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    switch (section) {
        case Profile:

            return 1;

        case Segment:

            return 1;

        case Content:

            return 1;

    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    double contentHeight = [[UIScreen mainScreen] bounds].size.height - 220 - 44 - [self navigationController].navigationBar.frame.size.height - [self tabBarController].tabBar.frame.size.height - 20;

    switch (indexPath.section) {

        case Profile:

            return UITableViewAutomaticDimension;

        case Segment:

            return UITableViewAutomaticDimension;

        case Content:

            return contentHeight;

    }

    return 150;

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 500;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        ProfileInfomationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileInfomationTableViewCell" forIndexPath:indexPath];

        if (self.currentUser != nil) {

            cell.nameLabel.text = self.currentUser.fullName;

            [cell.userImage sd_setImageWithURL: self.currentUser.imageUrl];

        }

        cell.selectionStyle = NO;

        return cell;
    }

    else if (indexPath.section == 1) {

        ProfileSegmentedControlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileSegmentedControlTableViewCell" forIndexPath:indexPath];

        cell.selectionStyle = NO;

        cell.favoriteButton.tag = 0;

        cell.purchasedButton.tag = 1;

        [self setUpSegmentButton: cell.favoriteButton];

        [self setUpSegmentButton: cell.purchasedButton];

        [cell.favoriteButton addTarget:self action:@selector(segmentClicked:) forControlEvents:UIControlEventTouchUpInside];

        [cell.purchasedButton addTarget:self action:@selector(segmentClicked:) forControlEvents:UIControlEventTouchUpInside];

        return cell;
    }

    else {

        if (self.favoriteSegmentClicked == YES) {

            ProductFavoriteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductFavoriteTableViewCell" forIndexPath:indexPath];

            cell.selectionStyle = NO;

            return cell;

        } else {

            ProfilePurchaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfilePurchaseTableViewCell" forIndexPath:indexPath];

            cell.selectionStyle = NO;

            return cell;
        }

    }

}

-(void)segmentClicked:(UIButton*)sender
{
    if (sender.tag == 0)
    {
        NSLog(@"favorite Btn Clicked\n");

        self.favoriteSegmentClicked = YES;

        NSLog(@"VALUE IS : %@", (_favoriteSegmentClicked) ? @"YES" : @"NO");

    }

    if (sender.tag == 1)
    {
        printf("purchased Btn Clicked\n");

        self.favoriteSegmentClicked = NO;

        NSLog(@"VALUE IS : %@", (_favoriteSegmentClicked) ? @"YES" : @"NO");

    }

    [self.tableView reloadData];
}

-(void)setUpSegmentButton:(UIButton*)sender
{
    UIColor *tappedblack = [UIColor
                            colorWithRed:0.0 / 255.0
                            green:0.0/ 255.0
                            blue:0.0 / 255.0
                            alpha:0.2
                            ];

    sender.layer.cornerRadius = 4.0;

    if (self.favoriteSegmentClicked == YES)
    {
        if (sender.tag == 0)
        {
            sender.backgroundColor = tappedblack;
        }
        else
        {
            sender.backgroundColor = [UIColor clearColor];
        }
    }
    else
    {
        if (sender.tag == 1)
        {
            sender.backgroundColor = tappedblack;
        }
        else
        {
            sender.backgroundColor = [UIColor clearColor];
        }
    }

}

- (void) managerDidGetUserProfile: (User *)user {

    dispatch_async(dispatch_get_main_queue(), ^{

        self.currentUser = user;

        [self.tableView reloadData];

    });

}

@end
