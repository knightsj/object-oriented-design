//
//  HWFactory.m
//  AFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "HWFactory.h"
#import "HWPhone.h"
#import "MateBookComputer.h"

@implementation HWFactory

+ (Phone *)createPhone{
    
    HWPhone *hwPhone = [[HWPhone alloc] init];
    NSLog(@"HWPhone has been created");
    return hwPhone;
}

+ (Computer *)createComputer{
    
    MateBookComputer *hwComputer = [[MateBookComputer alloc] init];
    NSLog(@"HWComputer has been created");
    return hwComputer;
}

@end
