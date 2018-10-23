//
//  PhoneHighClassBuilder.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/10/5.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "IPhoneXRBuilder.h"

@implementation IPhoneXRBuilder


- (void)createPhone{
    
    _phone = [[Phone alloc] init];
}


- (void)buildCPU{
    
    [_phone setCpu:@"A12"];
}

- (void)buildCapacity{

    [_phone setCapacity:@"256"];
}


- (void)buildDisplay{
    
    [_phone setDisplay:@"6.1"];
}

- (void)buildCamera{
    
    [_phone setCamera:@"12MP"];
}

- (Phone *)obtainPhone{
    return _phone;
}

@end
