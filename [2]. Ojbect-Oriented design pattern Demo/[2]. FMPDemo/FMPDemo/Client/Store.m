//
//  Store.m
//  SFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "Store.h"

@implementation Store

- (void)sellPhone:(Phone *)phone{
    NSLog(@"Store begins to sell phone:%@",[phone class]);
}

@end
