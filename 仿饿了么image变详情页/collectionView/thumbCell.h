//
//  thumbCell.h
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class foodModel;
@interface thumbCell : UICollectionViewCell
@property (nonatomic, strong)foodModel *model;

@property (nonatomic, strong)UIImageView *imgView;
@property (nonatomic, strong)UILabel *food;
@property (nonatomic, strong)UILabel *money;
@end
