//
//  MI8Builder.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/10/5.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "MI8Builder.h"

@implementation MI8Builder

- (void)createPhone{
    
    _phone = [[Phone alloc] init];
}


- (void)buildCPU{
    
    [_phone setCpu:@"Snapdragon 845"];
}

- (void)buildCapacity{
    
    [_phone setCapacity:@"128"];
}


- (void)buildDisplay{
    
    [_phone setDisplay:@"6.21"];
}

- (void)buildCamera{
    
    [_phone setCamera:@"12MP"];
}

- (Phone *)obtainPhone{
    return _phone;
}

@end
