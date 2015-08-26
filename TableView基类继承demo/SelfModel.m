//
//  SelfModel.m
//  TableView基类继承demo
//
//  Created by iMac on 15/8/26.
//  Copyright (c) 2015年 杭州熊管佳电子商务有限公司. All rights reserved.
//

#import "SelfModel.h"

@implementation SelfModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"photoImageIndex":@"photoImageIndex",
             @"name":@"name",
             @"mark":@"mark",
             @"title":@"title",
             @"clickImageIndex":@"clickImageIndex"
             };
}
@end
