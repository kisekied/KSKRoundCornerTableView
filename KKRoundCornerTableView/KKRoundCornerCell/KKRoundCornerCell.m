//
//  KKRoundCornerCell.m
//  KKRoundCornerTableview
//
//  Created by kisekied on 15/11/24.
//  Copyright © 2015年 kisekied. All rights reserved.
//

#import "KKRoundCornerCell.h"

@interface KKRoundCornerCell ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, copy) UIColor *fillColor;

@end

@implementation KKRoundCornerCell

- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier tableView:(UITableView *)tableView {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [super setBackgroundColor:[UIColor clearColor]];
        // 默认白色背景色
        _fillColor = [UIColor whiteColor];
        _cornerRadius = cornerRadius;
        _tableView = tableView;
        _shapeLayer = [CAShapeLayer layer];
        [self.layer insertSublayer:_shapeLayer atIndex:0];
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    _shapeLayer.frame = self.bounds;
    _shapeLayer.path = [self pathWithCellType:[self roundCornerType]].CGPath;
}

- (KKRoundCornerCellType)roundCornerType {
    NSIndexPath *indexPath = [_tableView indexPathForCell:self];
    if ([_tableView numberOfRowsInSection:indexPath.section] == 1) {
            return KKRoundCornerCellTypeSingleRow;
        } else if (indexPath.row == 0) {
            return KKRoundCornerCellTypeTop;
        } else if (indexPath.row == [_tableView numberOfRowsInSection:indexPath.section] - 1) {
            return KKRoundCornerCellTypeBottom;
        } else {
            return KKRoundCornerCellTypeDefault;
        }
}

- (UIBezierPath *)pathWithCellType:(KKRoundCornerCellType)cellType {
    
    UIBezierPath *path;
    
    switch (cellType) {
        case KKRoundCornerCellTypeTop: {
            path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(0, _cornerRadius)];
            [path addArcWithCenter:CGPointMake(_cornerRadius, _cornerRadius) radius:_cornerRadius startAngle:M_PI endAngle:- M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(self.bounds.size.width - _cornerRadius, 0)];
            [path addArcWithCenter:CGPointMake(self.bounds.size.width - _cornerRadius, _cornerRadius) radius:_cornerRadius startAngle:M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
            [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
            [path closePath];
            break;
        }
            
        case KKRoundCornerCellTypeBottom: {
            path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(0, self.bounds.size.height - _cornerRadius)];
            [path addArcWithCenter:CGPointMake(_cornerRadius, self.bounds.size.height - _cornerRadius) radius:_cornerRadius startAngle:M_PI endAngle:(M_PI_2) clockwise:NO];
            [path addLineToPoint:CGPointMake(self.bounds.size.width - _cornerRadius, self.bounds.size.height)];
            [path addArcWithCenter:CGPointMake(self.bounds.size.width - _cornerRadius, self.bounds.size.height - _cornerRadius) radius:_cornerRadius startAngle:(M_PI_2 * 3) endAngle:0 clockwise:NO];
            [path addLineToPoint:CGPointMake(self.bounds.size.width, 0)];
            [path addLineToPoint:CGPointMake(0, 0)];
            [path closePath];
            break;
        }
            
        case KKRoundCornerCellTypeSingleRow: {
            path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_cornerRadius];
            break;
        }

        case KKRoundCornerCellTypeDefault: {
            path = [UIBezierPath bezierPathWithRect:self.bounds];
            break;
        }
            
        default:
            break;
    }
    
    return path;
}

- (void)prepareForReuse {
    
    [super prepareForReuse];
    [self setNeedsDisplay];
    
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    if (_fillColor != backgroundColor) {
        _fillColor = nil;
        _fillColor = backgroundColor;
        _shapeLayer.fillColor = backgroundColor.CGColor;
    }
    
}



@end
