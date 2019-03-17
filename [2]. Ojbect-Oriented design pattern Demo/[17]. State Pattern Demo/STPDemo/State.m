//
//  State.m
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "State.h"


@implementation State

- (instancetype)initWithCoder:(Coder *)coder{
    
    self = [super init];
    if (self) {
        _coder = coder;
    }
    return self;
}

@end
