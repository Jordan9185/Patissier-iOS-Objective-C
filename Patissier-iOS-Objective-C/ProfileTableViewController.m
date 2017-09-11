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

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *cellNib = [UINib nibWithNibName:@"ProfileInfomationTableViewCell" bundle:nil];

    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"ProfileInfomationTableViewCell"];
    
    UINib *cellNib2 = [UINib nibWithNibName:@"ProfileSegmentedControlTableViewCell" bundle:nil];
    
    [self.tableView registerNib:cellNib2 forCellReuseIdentifier:@"ProfileSegmentedControlTableViewCell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    
    else {
        
        ProfileSegmentedControlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileSegmentedControlTableViewCell" forIndexPath:indexPath];
        
        cell.favoriteButton.backgroundColor = [UIColor clearColor];
        
        return cell;
    }


}

@end
