//
//  KSKRoundCornerCell.h
//  KKRoundCornerTableView
//
//  Created by kisekied on 16/2/3.
//  Copyright © 2016年 kisekied. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSKRoundCornerCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style radius:(CGFloat)radius indexPath:(NSIndexPath *)indexPath;

@end
