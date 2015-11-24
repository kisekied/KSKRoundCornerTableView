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

- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius Style:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setCornerRadius:cornerRadius];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    UIBezierPath *path;
    switch (_roundCornerType) {
        case KKRoundCornerCellTypeTop: {
            path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)];
            break;
        }
        
        case KKRoundCornerCellTypeBottom: {
            path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)];
            break;
        }
            
        case KKRoundCornerCellTypeSingleRow: {
            path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(_cornerRadius, _cornerRadius)];
            break;
        }
        
        case KKRoundCornerCellTypeDefault:
        default: {
            self.layer.mask = nil;
            return;
        }
    }
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
    
}

- (void)setRoundCornerType:(KKRoundCornerCellType)roundCornerType {
    _roundCornerType = roundCornerType;
    self.layer.mask = nil;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
}


@end
