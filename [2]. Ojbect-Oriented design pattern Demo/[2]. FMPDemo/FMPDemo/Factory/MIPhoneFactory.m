//
//  MIPhoneFactory.m
//  FMPDemo
//
//  Created by Sun Shijie on 2018/10/17.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "MIPhoneFactory.h"
#import "MIPhone.h"

@implementation MIPhoneFactory

+ (Phone *)createPhone{
    
    MIPhone *miPhone = [[MIPhone alloc] init];
    NSLog(@"MIPhone has been created");
    return miPhone;
}

@end
