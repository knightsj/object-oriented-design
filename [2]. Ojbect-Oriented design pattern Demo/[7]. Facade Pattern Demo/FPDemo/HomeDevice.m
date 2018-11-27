//
//  HomeDevice.m
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "HomeDevice.h"

@implementation HomeDevice

//连接电源
- (void)on{
    NSLog(@"%@ is on",[self class]);
}

//关闭电源
- (void)off{
    NSLog(@"%@ is off",[self class]);
}

@end
