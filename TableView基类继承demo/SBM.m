//
//  SBM.m
//  TableView基类继承demo
//
//  Created by iMac on 15/8/26.
//  Copyright (c) 2015年 杭州熊管佳电子商务有限公司. All rights reserved.
//

#import "SBM.h"

@interface SBM ()<BaseTableViewDelegate>

@end

@implementation SBM

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.title = @"德玛西亚";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma  markl - 基类代理方法必写 请求的数据需要此方法传过去
- (void)requestForBaseTableViewData
{
    //请求的数据 需要用_completeBlock接收，如果失败用_errorBlock接收
    /*
     [[[AppAPIHelper shared] getFindHttpAPI] getUnionUser_noteString:_sociatyId withPageIndex:self.pageNo completionBlockWithSuccess:_completeBlock failure:_errorBlock];
    */
    
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
