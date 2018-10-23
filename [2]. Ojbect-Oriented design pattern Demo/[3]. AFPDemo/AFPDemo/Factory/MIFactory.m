//
//  MiFactory.m
//  AFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "MIFactory.h"
#import "MIPhone.h"
#import "MIComputer.h"

@implementation MIFactory

+ (Phone *)createPhone{
    
    MIPhone *miPhone = [[MIPhone alloc] init];
    NSLog(@"MIPhone has been created");
    return miPhone;
}

+ (Computer *)createComputer{
    
    MIComputer *miComputer = [[MIComputer alloc] init];
    NSLog(@"MIComputer has been created");
    return miComputer;
}


@end
