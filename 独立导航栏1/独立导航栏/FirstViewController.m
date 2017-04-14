//
//  FirstViewController.m
//  独立导航栏
//
//  Created by 斌 on 2017/4/13.
//  Copyright © 2017年 斌. All rights reserved.
//


#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNav];
    
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}


// 创建导航栏
- (void)createNav{
    // 在主线程异步加载，使下面的方法最后执行，防止其他的控件挡住了导航栏
    dispatch_async(dispatch_get_main_queue(), ^{
        // 隐藏系统导航栏
        self.navigationController.navigationBar.hidden = YES;
        // 创建假的导航栏
        UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)];
        navView.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:navView];
        // 创建导航栏右边按钮
        UIButton *right= [UIButton buttonWithType:UIButtonTypeSystem];
        [right setTitle:@"下一页" forState:UIControlStateNormal];
        right.frame = CGRectMake(300, 0, 100, 44);
        [right addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
        [navView addSubview:right];
        // 创建导航栏的titleLabel
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0,44)];
        titleLabel.text = @"第一页";
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - titleLabel.frame.size.width / 2, 0, titleLabel.frame.size.width, 44);
        [navView addSubview:titleLabel];
        // 创建导航栏左边按钮
        UIButton *left= [UIButton buttonWithType:UIButtonTypeSystem];
        [navView addSubview:left];
        left.frame = CGRectMake(0, 0, 100, 44);
    });
}


- (void)nextAction{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController: vc animated:YES];
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
