//
//  thumbFlowLayout.m
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import "thumbFlowLayout.h"



@implementation thumbFlowLayout


/**
 在 collectionView 的第一次布局的时候，被调用，此时 collectionView 的 frame 已经设置完毕
 */
- (void)prepareLayout {
    [super prepareLayout];
    
    // 直接利用 collectionView 的属性设置布局
    self.itemSize = self.collectionView.bounds.size;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = YES;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
}

@end
