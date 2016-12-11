//
//  thumbView.m
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import "thumbView.h"
#import "thumbCell.h"
#import "thumbFlowLayout.h"
#import "introViewController.h"

@interface thumbView()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)NSArray *data;
@end

@implementation thumbView

static NSString *thumbCellID = @"thumbCellID";
- (instancetype)initWithData:(NSArray *)data {
    self = [super initWithFrame:CGRectZero collectionViewLayout:[thumbFlowLayout new]];
    if (self) {
        [self registerClass:[thumbCell class] forCellWithReuseIdentifier:thumbCellID];
        self.backgroundColor = [UIColor clearColor];
        self.delegate = self;
        self.dataSource = self;
        self.data = data;
    }
    
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath; {
    thumbCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:thumbCellID forIndexPath:indexPath];
    cell.model = self.data[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    thumbCell *cell = (thumbCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSArray *arr = @[cell.imgView, cell.food, cell.money];
    if ([self.dele respondsToSelector:@selector(didSelectForModel:thumbMoveViews:)]) {
        [self.dele didSelectForModel:self.data[indexPath.row] thumbMoveViews:arr];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
