//
//  IPhoneFactory.m
//  FMPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "IPhoneFactory.h"
#import "IPhone.h"

@implementation IPhoneFactory

+ (Phone *)createPhone{
    
    IPhone *iphone = [[IPhone alloc] init];
    NSLog(@"iPhone has been created");
    return iphone;
}

@end
