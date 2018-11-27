//
//  AppleFactory.m
//  AFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "AppleFactory.h"
#import "IPhone.h"
#import "MacBookComputer.h"

@implementation AppleFactory

+ (Phone *)createPhone{
    
    IPhone *iPhone = [[IPhone alloc] init];
    NSLog(@"iPhone has been created");
    return iPhone;
}

+ (Computer *)createComputer{
    
    MacBookComputer *macbook = [[MacBookComputer alloc] init];
    NSLog(@"Macbook has been created");
    return macbook;
}

@end
