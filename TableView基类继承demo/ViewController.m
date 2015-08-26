//
//  ViewController.m
//  TableView基类继承demo
//
//  Created by iMac on 15/8/26.
//  Copyright (c) 2015年 杭州熊管佳电子商务有限公司. All rights reserved.
//

#import "ViewController.h"
#import "SBM.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"战争学院";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 200);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"性感的红色按钮快点我吧" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)push
{
    SBM *sb = [[SBM alloc] init];
    [self.navigationController pushViewController:sb animated:YES];
}
@end
