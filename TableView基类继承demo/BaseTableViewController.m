//
//  BaseTableViewController.m
//  TableView基类继承demo
//
//  Created by iMac on 15/8/26.
//  Copyright (c) 2015年 杭州熊管佳电子商务有限公司. All rights reserved.
//

#import "BaseTableViewController.h"
#import "TableViewCell.h"
#import "SelfModel.h"
@interface BaseTableViewController ()
@property (nonatomic, strong)SelfModel *selfModel;//model类
@property (nonatomic, strong)NSMutableArray *indexArray;//点击纪录
@property (nonatomic , strong)NSMutableArray *array;//数据数组
@property (nonatomic, strong)NSMutableDictionary *dic;//纪录哪些被点中了
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    //展示有哪些被选中了
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 17);
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget: self action: @selector(go) forControlEvents: UIControlEventTouchUpInside];
    //添加到导航右方按钮
    UIBarButtonItem*back=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=back;
    
    
    //初始化数组
    _indexArray = [[NSMutableArray alloc] init];
    _dic = [[NSMutableDictionary alloc] init];
    //把数组置为0
    for (int i = 0; i <10; i++) {
        _indexArray[i] = [NSNumber numberWithInt:0];
    }
    
    //请求数据方法
    [self requestATSelf];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil];
        cell = [arr lastObject];
    }
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    //头像每次点击会刷新0-2的图片
    cell.photoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%u",arc4random()%3]];
    
    //因为没有请求数据所以数据自己写死了
//    _selfModel = [_array objectAtIndex:indexPath.row];
    cell.name.text = @"提百万";//_selfModel.name;
    cell.mark.text = @"xxxxxxxxxxxxxxxxxxxxxxxxx";//_selfModel.mark;
    cell.title.text = @"点击更换状态效果";//_selfModel.title;
    
    //点击根据状态切换图片
    if ([_indexArray[indexPath.section] integerValue] == 0) {
        [cell.clickImageView setImage:[UIImage imageNamed:@"4"]];
    }else{
        [cell.clickImageView setImage:[UIImage imageNamed:@"5.gif"]];
    }
    // Configure the cell...
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 122;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获的当前选择项
    //判断是否被点击过
    if ([_indexArray[indexPath.section] integerValue] == 0){
        //没被点击  记录数组为1
        _indexArray[indexPath.section] = [NSNumber numberWithInt:1];
        [_dic setValue:_indexArray[indexPath.section] forKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]];
    }
    else{
        //被点击过  记录数组为0
        _indexArray[indexPath.section] = [NSNumber numberWithInt:0];
        //如果已经被点击那么就移除纪录
        [_dic removeObjectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma  mark - Request

- (void)request
{
    //需要请求数据时直接在子类中调用
    if ([self.delegate respondsToSelector:@selector(requestForBaseTableViewData)])
    {
        [self.delegate requestForBaseTableViewData];
    }
}

- (void)requestATSelf
{
    //仅供参考
//    __weak BaseTableViewController * SELF = self;
    _completeBlock = ^(id data){
        NSLog(@"union-%@",data);
        /*
         //请求时移除数据数组中的所有对象
        [SELF.selfDataArray removeAllObjects];
         //赋值
        [SELF.selfDataArray addObjectsFromArray:data];
         //以下为下拉刷新和上拉加载方法 可以无视 如果有刷新加载需求   直接重新调用[self request] 方法 刷新即可
        [SELF.egoRTHV egoRefreshScrollViewDataSourceDidFinishedLoading:SELF.tableView];
        [SELF.loadMTFV loadMoreScrollViewDataSourceDidFinishedLoading:SELF.tableView data:data totalDataArray:SELF.selfDataArray];
         */
    };
    
    _errorBlock = ^(NSError *error){
        /*
        [SELF.egoRTHV egoRefreshScrollViewDataSourceDidFinishedLoading:SELF.tableView];
        [SELF.loadMTFV loadMoreScrollViewDataSourceDidFinishedLoading:SELF.tableView data:nil totalDataArray:SELF.selfDataArray];
        [SELF zhuHUD_showModelHUDWithModeText:[error localizedDescription]];
         */
    };
    [self.tableView reloadData];
}

- (void)go
{
    
    NSMutableArray *array = [[NSMutableArray alloc] init];//初始化可变数组
    NSString *dic_array;//遍历接受所选编号
    NSString *cardId;//编号
    for (dic_array in _dic) {

        
        //根据_dic得到的索引取出想要的值
        cardId = [NSString stringWithFormat:@"%ld",[dic_array integerValue]];
//        cardId = [[_array objectAtIndex:[dic_array integerValue]] valueForKey:@"id"];
        NSLog(@"cardId%@",cardId);
        //获得想要的值后加入数组中
        [array addObject:cardId];
    }
    NSLog(@"array%@",array);
    NSString *str = [NSString stringWithFormat:@"%@-被选中了",array];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LOL" message:str delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}
@end
