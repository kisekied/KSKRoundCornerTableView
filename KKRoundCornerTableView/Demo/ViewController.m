//
//  ViewController.m
//  KKRoundCornerTableView
//
//  Created by kisekied on 15/11/24.
//  Copyright © 2015年 kisekied. All rights reserved.
//

#import "ViewController.h"
#import "KSKRoundCornerCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArr = [NSMutableArray arrayWithArray:@[@"A", @"B", @"C", @"D", @"E", @"F", @"G"]];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - TableView Delegate & DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return _dataArr.count;
    } else {
        return section + 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KSKRoundCornerCell *cell = [KSKRoundCornerCell cellWithTableView:tableView style:UITableViewCellStyleDefault radius:10.0f indexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0
                                           green:arc4random() % 255 / 255.0
                                            blue:arc4random() % 255 / 255.0
                                           alpha:1.0];
    NSLog(@"%@\n%@", cell, cell.backgroundColor);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3) {
        return YES;
    } else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_dataArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
