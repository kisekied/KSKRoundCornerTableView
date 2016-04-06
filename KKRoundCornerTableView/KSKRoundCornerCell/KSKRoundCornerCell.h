//
//  KSKRoundCornerCell.h
//  KKRoundCornerTableView
//
//  Created by kisekied on 16/2/3.
//  Copyright © 2016年 kisekied. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSKRoundCornerCell : UITableViewCell

/**
 *  带边框的cell
 *
 *  @param tableView   cell所属的tableView
 *  @param style       tableView style
 *  @param radius      圆角大小
 *  @param indexPath   indexPath
 *  @param lineWidth   边框线的宽度，不宜过大
 *  @param strokeColor 边框线的颜色，默认grayColor
 *
 *  @return cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style radius:(CGFloat)radius indexPath:(NSIndexPath *)indexPath strokeLineWidth:(CGFloat)lineWidth strokeColor:(UIColor *)strokeColor;

/**
 *  无边框
 *
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style radius:(CGFloat)radius indexPath:(NSIndexPath *)indexPath;



@end
