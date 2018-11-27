//
//  SauceDecorator.m
//  DPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "SauceDecorator.h"

@implementation SauceDecorator

- (instancetype)initWithSalad:(Salad *)salad{
    
    self = [super init];
    
    if (self) {
        self.salad = salad;
    }
    return self;
}


@end
