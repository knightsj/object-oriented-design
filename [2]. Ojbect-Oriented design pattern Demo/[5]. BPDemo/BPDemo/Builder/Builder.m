//
//  Builder.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/10/5.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "Builder.h"


@implementation Builder


- (void)createPhone{
    NSLog(@"implement by subclass");
}

- (void)buildCPU{
    NSLog(@"implement by subclass");
}

- (void)buildCapacity{
    NSLog(@"implement by subclass");
}

- (void)buildDisplay{
    NSLog(@"implement by subclass");
}

- (void)buildCamera{
    NSLog(@"implement by subclass");
}


- (Phone *)obtainPhone{
    return nil;
}

@end
