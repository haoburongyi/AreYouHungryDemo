//
//  thumbViewController.m
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import "thumbViewController.h"
#import "thumbView.h"
#import "foodModel.h"
#import "introViewController.h"

#import "XWMagicMoveAnimator.h"
#import "UIViewController+XWTransition.h"
#import "UINavigationController+XWTransition.h"

@interface thumbViewController ()<thumbViewDelegate>

@end

@implementation thumbViewController {
    thumbView *_collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    [self setUpBlur];
    [self createCollectionView];
}


- (void)setUpBlur {
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectView.frame = self.view.bounds;
    [self.view addSubview:effectView];
    
     effectView.alpha = .5f;
}
- (void)createCollectionView {
    NSMutableArray *muArr = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        foodModel *model = [foodModel new];
        model.imgName = [NSString stringWithFormat:@"hahaha%02d.jpg", i];
        model.foodName = [NSString stringWithFormat:@"方便面 %d 号", i];
        model.money = (i + 1) * 10;
        [muArr addObject:model];
    }
    thumbView *collectionView = [[thumbView alloc] initWithData:muArr.copy];
    collectionView.dele = self;
    
    CGFloat topMargin = SCaleH(100);
    collectionView.frame = CGRectMake(0, topMargin, self.view.bounds.size.width, self.view.bounds.size.height - 2 * topMargin);
    [self.view addSubview:collectionView];
    _collectionView = collectionView;
}
- (void)didSelectForModel:(foodModel *)model thumbMoveViews:(NSArray *)group {
    [self xw_addMagicMoveStartViewGroup:group];
    XWMagicMoveAnimator *animator = [XWMagicMoveAnimator new];
//    animator.dampingEnable = YES;
    animator.imageMode = NO;
    animator.toDuration = 0.5f;
    animator.backDuration = 0.5f;
    introViewController *fromVC = [introViewController new];
    fromVC.model = model;
    
//    [self.navigationController xw_pushViewController:fromVC withAnimator:animator];
    [self xw_presentViewController:fromVC withAnimator:animator];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
