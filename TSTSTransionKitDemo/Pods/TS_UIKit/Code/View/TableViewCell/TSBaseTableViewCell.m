//
//  TSBaseTableViewCell.m
//  TSUIKit
//
//  Created by three stone 王 on 2018/7/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

#import "TSBaseTableViewCell.h"
#import "TSColorCommon.h"
@interface TSBaseTableViewCell()

@property (nonatomic ,strong) UIImageView *bottomView;

@end

@implementation TSBaseTableViewCell

- (UIImageView *)bottomView {
    
    if (!_bottomView) {
        
        _bottomView = [UIImageView new];
    }
    return _bottomView;
}

+ (instancetype)instance:(BottomLineType)bottomLineType withReuseId:(NSString *)iden {
    
    return [[self alloc] initWith:bottomLineType withReuseId:iden];
}
- (instancetype)initWith:(BottomLineType)bottomLineType withReuseId:(NSString *)iden {
    
    _bottomLineType = bottomLineType;
    
    return [self initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:iden];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self commitInit];
    }
    return self;
}
- (void)commitInit {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor = [UIColor clearColor];
    
    [self.contentView addSubview:self.bottomView];
}
- (void)setBottomLineType:(BottomLineType)bottomLineType {
    _bottomLineType = bottomLineType;
    
    switch (bottomLineType) {
        case BottomLineTypeNone:
            
        {
            self.bottomView.backgroundColor = [UIColor clearColor];
            
        }
            break;
        case BottomLineTypeNormal:
        {
            self.bottomView.backgroundColor = SEPERATOR_COLOR;
            
        }
            break;
        default:
            break;
    }
}

- (void)updateViewData:(TSBaseTableBean *)data {
    
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bottomView.frame = CGRectMake(0, CGRectGetHeight(self.bounds) - 1, CGRectGetWidth(self.bounds), 1);
}
@end
