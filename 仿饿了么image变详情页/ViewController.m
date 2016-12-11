//
//  ViewController.m
//  仿饿了么image变详情页
//
//  Created by 张淏 on 16/12/11.
//  Copyright © 2016年 张淏. All rights reserved.
//

#import "ViewController.h"
#import "thumbViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton new];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(gotoThumbPage) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)gotoThumbPage {
    thumbViewController *vc = [thumbViewController new];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];

    [self presentViewController:vc animated:NO completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
