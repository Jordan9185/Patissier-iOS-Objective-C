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

@interface ProfileTableViewController ()

@property (nonatomic, assign) BOOL favoriteSegmentClicked;

@end

@implementation ProfileTableViewController

@synthesize favoriteSegmentClicked = _favoriteSegmentClicked;

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *cellNib = [UINib nibWithNibName:@"ProfileInfomationTableViewCell" bundle:nil];

    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"ProfileInfomationTableViewCell"];
    
    UINib *cellNib2 = [UINib nibWithNibName:@"ProfileSegmentedControlTableViewCell" bundle:nil];
    
    [self.tableView registerNib:cellNib2 forCellReuseIdentifier:@"ProfileSegmentedControlTableViewCell"];
    
    UINib *cellNib3 = [UINib nibWithNibName:@"ProfileContentFavoriteTableViewCell" bundle:nil];
    
    [self.tableView registerNib:cellNib3 forCellReuseIdentifier:@"ProfileContentFavoriteTableViewCell"];

    self.favoriteSegmentClicked = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

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
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        ProfileInfomationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileInfomationTableViewCell" forIndexPath:indexPath];
        
        cell.name.text = @"James";
        
        return cell;
    }
    
    else if (indexPath.section == 1) {
        
        ProfileSegmentedControlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileSegmentedControlTableViewCell" forIndexPath:indexPath];
        
        cell.favoriteButton.backgroundColor = [UIColor clearColor];
        cell.favoriteButton.tag = 0;
        cell.purchasedButton.tag = 1;
        [cell.favoriteButton addTarget:self action:@selector(segmentClicked:) forControlEvents:UIControlEventTouchUpInside];
        [cell.purchasedButton addTarget:self action:@selector(segmentClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    
    else {
        
        ProfileContentFavoriteTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"ProfileContentFavoriteTableViewCell" forIndexPath:indexPath];
        
        ProfileSegmentedControlTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"ProfileSegmentedControlTableViewCell" forIndexPath:indexPath];
        
        if (self.favoriteSegmentClicked == YES) {
            return cell1;

        } else {
            return cell2;
        }
        
    }
    
    
//    ProfileInfomationTableViewCell *profilecell = [tableView dequeueReusableCellWithIdentifier:@"ProfileInfomationTableViewCell" forIndexPath:indexPath];
//    
//    profilecell.name.text = @"James";
//
//    
//    ProfileSegmentedControlTableViewCell *segmentcell = [tableView dequeueReusableCellWithIdentifier:@"ProfileSegmentedControlTableViewCell" forIndexPath:indexPath];
//    
//    segmentcell.favoriteButton.backgroundColor = [UIColor clearColor];
//    
//    
//    switch (indexPath.section) {
//        case Profile:
//            
//            return profilecell;
//            
//        case Segment:
//            
//            return segmentcell;
//            
//        case Content:
//            return segmentcell;
//            
//    }
//    
//    return profilecell;


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

@end
