//
//  YCGTableViewController.m
//  Taksiv
//
//  Created by yaakov gamliel on 3/8/14.
//  Copyright (c) 2014 Yaakov Gamliel. All rights reserved.
//

#import "YCGTableViewController.h"

@interface YCGTableViewController ()

@end

@implementation YCGTableViewController


- (id)init {
   self = [self initWithStyle:UITableViewStylePlain];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YCGChartTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 1;
    } else {
        return 20;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Bad trick to hide the last cell in laste section just to use that sections header for second
    // section with the desired behavior.
    if (indexPath.section == 2) {
        return 0.0;
    }
    return 82.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 2) {
        return 80.0;
    } else {
        return 0.0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 320.0, 50.0)];
    headerView.backgroundColor = [UIColor colorWithRed:0.994 green:0.986 blue:1.000 alpha:1.000];
    return headerView;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 320.0, 80.0)];
    headerView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:1.000];
    return headerView;
}

@end
