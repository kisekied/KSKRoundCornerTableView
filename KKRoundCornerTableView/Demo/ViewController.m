//
//  ViewController.m
//  KKRoundCornerTableView
//
//  Created by kisekied on 15/11/24.
//  Copyright © 2015年 kisekied. All rights reserved.
//

#import "ViewController.h"
#import "KKRoundCornerCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - TableView Delegate & DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellID = @"CELLID";
    KKRoundCornerCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[KKRoundCornerCell alloc] initWithCornerRadius:10.0f Style:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    
    if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
        cell.roundCornerType = KKRoundCornerCellTypeSingleRow;
    } else if (indexPath.row == 0) {
        cell.roundCornerType = KKRoundCornerCellTypeTop;
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        cell.roundCornerType = KKRoundCornerCellTypeBottom;
    } else {
        cell.roundCornerType = KKRoundCornerCellTypeDefault;
    }
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 256.0
                                          green:arc4random() % 256 / 256.0
                                           blue:arc4random() % 256 / 256.0
                                          alpha:1.0];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组第%ld行", indexPath.section + 1, indexPath.row + 1];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
