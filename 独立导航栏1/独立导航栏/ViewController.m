//
//  ViewController.m
//  独立导航栏
//
//  Created by 斌 on 2017/4/13.
//  Copyright © 2017年 斌. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)action{
    FirstViewController *vc = [[FirstViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
