//
//  thumbView.h
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import <UIKit/UIKit.h>


@class foodModel;
@protocol thumbViewDelegate <NSObject>

- (void)didSelectForModel:(foodModel *)model thumbMoveViews:(NSArray *)group;

@end

@interface thumbView : UICollectionView
- (instancetype)initWithData:(NSArray *)data;
@property (nonatomic, weak)id <thumbViewDelegate> dele;
@end
