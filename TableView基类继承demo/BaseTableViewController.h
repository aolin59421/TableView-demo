//
//  BaseTableViewController.h
//  TableView基类继承demo
//
//  Created by iMac on 15/8/26.
//  Copyright (c) 2015年 杭州熊管佳电子商务有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
//创建接收block块
typedef void (^CompleteBlock)(id data);
typedef void (^ErrorBlock)(NSError* error);
//创建代理
@protocol BaseTableViewDelegate <NSObject>

- (void)requestForBaseTableViewData;

@end
@interface BaseTableViewController : UITableViewController
{
    /**
     * 请求失败block
     */
@protected
    ErrorBlock _errorBlock;
    /**
     * 请求成功 block
     */
@protected
    CompleteBlock _completeBlock;
}
@property (nonatomic , weak)id <BaseTableViewDelegate>delegate;

@end
