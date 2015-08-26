//
//  TableViewCell.m
//  TableView基类继承demo
//
//  Created by iMac on 15/8/26.
//  Copyright (c) 2015年 杭州熊管佳电子商务有限公司. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.name setBackgroundColor:[UIColor greenColor]];
    [self.mark setBackgroundColor:[UIColor grayColor]];
    self.mark.numberOfLines = 0;
    [self.mark setFont:[UIFont systemFontOfSize:11]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
