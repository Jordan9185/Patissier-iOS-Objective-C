//
//  ProfilePurchaseTableViewCell.m
//  Patissier-iOS-Objective-C
//
//  Created by CdxN on 2017/9/12.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

#import "ProfilePurchaseTableViewCell.h"
#import "PurchasedProductTableViewCell.h"

@interface ProfilePurchaseTableViewCell () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ProfilePurchaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PurchasedProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PurchasedProductTableViewCell" forIndexPath:indexPath];

    return cell;
}
@end
