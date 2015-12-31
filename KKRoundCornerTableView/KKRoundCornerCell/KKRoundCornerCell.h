//
//  KKRoundCornerCell.h
//  KKRoundCornerTableview
//
//  Created by kisekied on 15/11/24.
//  Copyright © 2015年 kisekied. All rights reserved.
//

#import <UIKit/UIKit.h>

// TableViewCell 圆角样式
typedef NS_ENUM (NSUInteger, KKRoundCornerCellType) {
    KKRoundCornerCellTypeDefault,       /**< 默认无圆角 */
    KKRoundCornerCellTypeTop,           /**< 顶部圆角 */
    KKRoundCornerCellTypeBottom,        /**< 尾部圆角 */
    KKRoundCornerCellTypeSingleRow      /**< 四角圆角 */
};

@interface KKRoundCornerCell : UITableViewCell

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) KKRoundCornerCellType roundCornerType;    /**< 圆角类型 */

@property (nonatomic, assign) CGFloat cornerRadius; /**< 圆角大小 */

/**
 *  构造方法
 */
- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView;

@end
