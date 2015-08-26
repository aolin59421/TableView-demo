//
//  TableViewController.m
//  TableView基类继承demo
//
//  Created by iMac on 15/8/26.
//  Copyright (c) 2015年 杭州熊管佳电子商务有限公司. All rights reserved.
//

#import "BaseTableViewController"
#import "TableViewCell.h"
#import "SelfModel.h"

@interface UITableViewController ()
@property (nonatomic, strong)SelfModel *selfModel;
@property (nonatomic, strong)NSMutableArray *indexArray;
@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _selfModel.name = @"成渣";
    _selfModel.mark = @"为了给你们写demo，浪费了我好多时间";
    _selfModel.title = @"大成狗要的点击效果";
    
    _indexArray = @{}.mutableCopy;
    //把数组置为0
    for (int i = 0; i <10; i++) {
        _indexArray[i] = [NSNumber numberWithInt:0];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndentifier = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.photoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%u",arc4random()%3]];
    cell.name.text = _selfModel.name;
    cell.mark.text = _selfModel.mark;
    cell.title.text = _selfModel.title;
    
    if ([_indexArray[indexPath.row] integerValue] == 0) {
        [cell.clickImageView setImage:[UIImage imageNamed:@"4"]];
    }else{
        [cell.clickImageView setImage:[UIImage imageNamed:@"5.gif"]];
    }
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获的当前选择项
    //判断是否被点击过
    if ([_indexArray[indexPath.section] integerValue] == 0){
        //没被点击  记录数组为1
        _indexArray[indexPath.section] = [NSNumber numberWithInt:1];
    }
    else{
        //被点击过  记录数组为0
        _indexArray[indexPath.section] = [NSNumber numberWithInt:0];
    }
    [self.tableView reloadData];
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

@end
