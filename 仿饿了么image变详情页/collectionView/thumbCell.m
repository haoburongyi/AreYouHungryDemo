//
//  thumbCell.m
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import "thumbCell.h"
#import "foodModel.h"

@implementation thumbCell 

- (void)setModel:(foodModel *)model {
    _model = model;
    _imgView.image = [UIImage imageNamed:model.imgName];
    _food.text = model.foodName;
    _money.text = [NSString stringWithFormat:@"%.2f", model.money];
    [_food sizeToFit];
    [_money sizeToFit];
    CGFloat leftMargin = SCaleW(6);
    CGFloat topMargin = SCaleH(6);
    _money.frame = CGRectMake(leftMargin, CGRectGetMaxY(_food.frame) + topMargin, _money.bounds.size.width, _money.bounds.size.height);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self createUI];
    }
    return self;
}
- (void)createUI {
    UIView *bgView = [UIView new];
    CGFloat margin = SCaleW(20);
    bgView.frame = CGRectMake(margin, 0, self.contentView.bounds.size.width - 2 * margin, self.contentView.bounds.size.height);
    bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgView];
    
    UIImageView *imgView = [UIImageView new];
    imgView.frame = CGRectMake(0, 0, bgView.frame.size.width, 300);
    imgView.backgroundColor = RandomColor;
    imgView.clipsToBounds = YES;
    [bgView addSubview:imgView];
    
    CGFloat leftMargin = SCaleW(6);
    CGFloat topMargin = SCaleH(6);
    
    UILabel *food = [UILabel new];
    food.frame = CGRectMake(leftMargin, CGRectGetMaxY(imgView.frame) + topMargin, 0, 0);
    [bgView addSubview:food];
    
    UILabel *money = [UILabel new];
    money.frame = CGRectMake(leftMargin, CGRectGetMaxY(food.frame), 0, 0);
    [bgView addSubview:money];
    
    _imgView = imgView;
    _food = food;
    _money = money;
}

@end
