//
//  HWPhoneFactory.m
//  FMPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "HWPhoneFactory.h"
#import "HWPhone.h"

@implementation HWPhoneFactory

+ (Phone *)createPhone{
    
    HWPhone *hwPhone = [[HWPhone alloc] init];
    NSLog(@"HWPhone has been created");
    return hwPhone;
}

@end
