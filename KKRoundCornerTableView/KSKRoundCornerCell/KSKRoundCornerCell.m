//
//  KSKRoundCornerCell.m
//  KKRoundCornerTableView
//
//  Created by kisekied on 16/2/3.
//  Copyright © 2016年 kisekied. All rights reserved.
//

#import "KSKRoundCornerCell.h"

typedef NS_ENUM(NSInteger, KSKRoundCornerCellType) {
    KSKRoundCornerCellTypeTop,
    KSKRoundCornerCellTypeCenter,
    KSKRoundCornerCellTypeBootom,
    KSKRoundCornerCellTypeAll,
};

@interface KSKRoundCornerCell ()

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) KSKRoundCornerCellType cellType;

@end

@implementation KSKRoundCornerCell

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [super setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style radius:(CGFloat)radius indexPath:(NSIndexPath *)indexPath {
    static NSString *kCellID = @"KSKRoundCornerCell";
    KSKRoundCornerCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[KSKRoundCornerCell alloc] initWithStyle:style reuseIdentifier:kCellID];
        cell.radius = radius;
        cell.tableView = tableView;
    }
    
    cell.indexPath = indexPath;
    return cell;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    ((CAShapeLayer *)(self.layer)).path = [self bezierPathWithCellType:[self cellType] width:frame.size.width height:frame.size.height].CGPath;
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    if (_indexPath != indexPath) {
        _indexPath = indexPath;
        
        [self autoSetCellType];
    }
    
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    
    if (_fillColor != backgroundColor) {
        _fillColor = backgroundColor;
        ((CAShapeLayer *)(self.layer)).fillColor = _fillColor.CGColor;
    }
}

- (UIColor *)backgroundColor {
    return _fillColor;
}

- (UIColor *)fillColor {
    if (!_fillColor) {
        // 默认cell背景色为白色
        _fillColor = [UIColor whiteColor];
    }
    return _fillColor;
}


- (void)autoSetCellType {
    NSLog(@"_tableView === %@", _tableView);
    NSLog(@"%ld", [_tableView numberOfRowsInSection:self.indexPath.section]);
    if ([_tableView numberOfRowsInSection:self.indexPath.section] == 1) {
        self.cellType = KSKRoundCornerCellTypeAll;
    } else if (self.indexPath.row == 0) {
        self.cellType = KSKRoundCornerCellTypeTop;
    } else if (self.indexPath.row == [_tableView numberOfRowsInSection:self.indexPath.section] - 1) {
        self.cellType = KSKRoundCornerCellTypeBootom;
    } else {
        self.cellType = KSKRoundCornerCellTypeCenter;
    }
}

- (UIBezierPath *)bezierPathWithCellType:(KSKRoundCornerCellType)cellType width:(CGFloat)width height:(CGFloat)height {
    UIBezierPath *bezierPath;
    switch (self.cellType) {
        case KSKRoundCornerCellTypeAll: {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width, height) cornerRadius:self.radius];
            break;
        }
        case KSKRoundCornerCellTypeTop: {
            bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:CGPointMake(0, self.radius)];
            [bezierPath addArcWithCenter:CGPointMake(self.radius, self.radius) radius:self.radius startAngle:M_PI endAngle:-M_PI_2 clockwise:YES];
            [bezierPath addLineToPoint:CGPointMake(width - self.radius, 0)];
            [bezierPath addArcWithCenter:CGPointMake(width - self.radius, self.radius) radius:self.radius startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [bezierPath addLineToPoint:CGPointMake(width, height)];
            [bezierPath addLineToPoint:CGPointMake(0, height)];
            [bezierPath closePath];
            break;
        }
        case KSKRoundCornerCellTypeBootom: {
            bezierPath = [UIBezierPath bezierPath];
            [bezierPath moveToPoint:CGPointMake(0, height - self.radius)];
            [bezierPath addArcWithCenter:CGPointMake(self.radius, height - self.radius) radius:self.radius startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
            [bezierPath addLineToPoint:CGPointMake(width - self.radius, height)];
            [bezierPath addArcWithCenter:CGPointMake(width - self.radius, height - self.radius) radius:self.radius startAngle:M_PI_2 endAngle:0 clockwise:NO];
            [bezierPath addLineToPoint:CGPointMake(width, 0)];
            [bezierPath addLineToPoint:CGPointMake(0, 0)];
            [bezierPath closePath];
            break;
        }
        case KSKRoundCornerCellTypeCenter: {
            bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, width, height)];
            break;
        }
        default:
            break;
    }
    return bezierPath;
}

@end
