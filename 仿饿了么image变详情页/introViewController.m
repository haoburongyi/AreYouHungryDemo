//
//  introViewController.m
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import "introViewController.h"
#import "foodModel.h"
#import "thumbViewController.h"

#import "XWMagicMoveAnimator.h"
#import "UIViewController+XWTransition.h"
#import "UINavigationController+XWTransition.h"

@interface introViewController ()

@end

@implementation introViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.model.imgName]];
    imgView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    imgView.clipsToBounds = YES;
    [self.view addSubview:imgView];
    
    CGFloat margin = 6;
    UILabel *food = [[UILabel alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(imgView.frame) + margin, 0, 0)];
    food.text = self.model.foodName;
    [food sizeToFit];
    [self.view addSubview:food];
    
    UILabel *money = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - margin - 100, CGRectGetMaxY(food.frame) + margin, 0, 0)];
    money.text = [NSString stringWithFormat:@"¥%.2f", self.model.money];
    [money sizeToFit];
    [self.view addSubview:money];
    
    [self xw_addMagicMoveEndViewGroup:@[imgView, food, money]];
    
    __weak typeof(self)weakSelf = self;
    [self xw_registerToInteractiveTransitionWithDirection:XWInteractiveTransitionGestureDirectionDown transitonBlock:^(CGPoint startPoint){
        [weakSelf back];
    } edgeSpacing:0];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(self.view.bounds.size.width * 0.5 - 50, self.view.bounds.size.height - 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)back {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

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
