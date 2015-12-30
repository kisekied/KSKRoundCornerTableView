//
//  KKRoundCornerCell.m
//  KKRoundCornerTableview
//
//  Created by kisekied on 15/11/24.
//  Copyright © 2015年 kisekied. All rights reserved.
//

#import "KKRoundCornerCell.h"

@interface KKRoundCornerCell ()


@end

@implementation KKRoundCornerCell

- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier fillColor:(UIColor *)fillColor {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        [self setCornerRadius:cornerRadius];
        [self setFillColor:fillColor];
    }
    
    return self;
}


- (void)setRoundCornerType:(KKRoundCornerCellType)roundCornerType {
    _roundCornerType = roundCornerType;
}


- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    
    [_fillColor setFill];
    
    
    CGRect cellRect = self.bounds;
    CGFloat radius = self.cornerRadius;
    CGContextBeginPath(context);
    
    switch (_roundCornerType) {
        case KKRoundCornerCellTypeSingleRow: {
            CGContextMoveToPoint(context, CGRectGetMinX(cellRect) + radius, CGRectGetMinY(cellRect));
            CGContextAddArc(context, CGRectGetMaxX(cellRect) - radius, CGRectGetMinY(cellRect) + radius, radius, 3 * (float)M_PI / 2, 0, 0);
            CGContextAddArc(context, CGRectGetMaxX(cellRect) - radius, CGRectGetMaxY(cellRect) - radius, radius, 0, (float)M_PI / 2, 0);
            CGContextAddArc(context, CGRectGetMinX(cellRect) + radius, CGRectGetMaxY(cellRect) - radius, radius, (float)M_PI / 2, (float)M_PI, 0);
            CGContextAddArc(context, CGRectGetMinX(cellRect) + radius, CGRectGetMinY(cellRect) + radius, radius, (float)M_PI, 3 * (float)M_PI / 2, 0);
            CGContextClosePath(context);
            CGContextFillPath(context);
            break;
        }
            
        case KKRoundCornerCellTypeTop: {
            CGContextMoveToPoint(context, CGRectGetMinX(cellRect) + radius, CGRectGetMinY(cellRect));
            CGContextAddArc(context, CGRectGetMaxX(cellRect) - radius, CGRectGetMinY(cellRect) + radius, radius, 3 * (float)M_PI / 2, 0, 0);
            CGContextAddLineToPoint(context, CGRectGetMaxX(cellRect), CGRectGetMaxY(cellRect));
            CGContextAddLineToPoint(context, CGRectGetMinX(cellRect), CGRectGetMaxY(cellRect));
            CGContextAddArc(context, CGRectGetMinX(cellRect) + radius, CGRectGetMinY(cellRect) + radius, radius, (float)M_PI, 3 * (float)M_PI / 2, 0);
            CGContextClosePath(context);
            CGContextFillPath(context);
            break;
        }
            
            
        case KKRoundCornerCellTypeBottom: {
            CGContextMoveToPoint(context, CGRectGetMinX(cellRect), CGRectGetMinY(cellRect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(cellRect), CGRectGetMinY(cellRect));
            CGContextAddArc(context, CGRectGetMaxX(cellRect) - radius, CGRectGetMaxY(cellRect) - radius, radius, 0, (float)M_PI / 2, 0);
            CGContextAddArc(context, CGRectGetMinX(cellRect) + radius, CGRectGetMaxY(cellRect) - radius, radius, (float)M_PI / 2, (float)M_PI, 0);
            CGContextAddLineToPoint(context, CGRectGetMinX(cellRect), CGRectGetMinY(cellRect));
            CGContextClosePath(context);
            CGContextFillPath(context);
            break;
        }
            
        case KKRoundCornerCellTypeDefault: {
            CGContextMoveToPoint(context, CGRectGetMinX(cellRect), CGRectGetMinY(cellRect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(cellRect), CGRectGetMinY(cellRect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(cellRect), CGRectGetMaxY(cellRect));
            CGContextAddLineToPoint(context, CGRectGetMinX(cellRect), CGRectGetMaxY(cellRect));
            CGContextAddLineToPoint(context, CGRectGetMinX(cellRect), CGRectGetMinY(cellRect));
            CGContextClosePath(context);
            CGContextFillPath(context);
            break;
        }
            
        default:
            break;
    }
    
    
}

- (void)setFillColor:(UIColor *)fillColor {
    if (_fillColor != fillColor) {
        _fillColor = nil;
        _fillColor = fillColor;
        [self setNeedsDisplay];
    }
}


@end
