
//
//  SecondViewController.m
//  独立导航栏
//
//  Created by 斌 on 2017/4/13.
//  Copyright © 2017年 斌. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createNav];
    
}

// 创建“导航栏”
- (void)createNav{
    // 在主线程异步加载，使下面的方法最后执行，防止其他的控件挡住了导航栏
    dispatch_async(dispatch_get_main_queue(), ^{
        // 隐藏系统导航栏
        self.navigationController.navigationBar.hidden = YES;
        // 创建假的导航栏
        UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)];
        [self.view addSubview:navView];
        // 创建导航栏的titleLabel
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0,44)];
        titleLabel.text = @"第二页";
        [titleLabel sizeToFit];
        titleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - titleLabel.frame.size.width / 2, 0, titleLabel.frame.size.width, 44);
        [navView addSubview:titleLabel];
        // 创建导航栏右边按钮
        UIButton *right= [UIButton buttonWithType:UIButtonTypeSystem];
        [right setTitle:@"下一页" forState:UIControlStateNormal];
        right.frame = CGRectMake(300, 0, 100, 44);
        [right addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
        [navView addSubview:right];
        // 创建导航栏左按钮
        UIButton *left= [UIButton buttonWithType:UIButtonTypeSystem];
        [left setTitle:@"上一页" forState:UIControlStateNormal];
        [left addTarget:self action:@selector(preAction) forControlEvents:UIControlEventTouchUpInside];
        [navView addSubview:left];
        left.frame = CGRectMake(0, 0, 100, 44);
    });
}


// 导航栏右边按钮方法
- (void)nextAction{
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController: vc animated:YES];
}
// 导航栏左边按钮方法
- (void)preAction{
    [self.navigationController popViewControllerAnimated:YES];
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
