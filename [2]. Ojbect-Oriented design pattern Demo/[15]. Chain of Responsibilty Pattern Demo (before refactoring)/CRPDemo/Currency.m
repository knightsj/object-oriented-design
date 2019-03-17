


//
//  Currency.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Currency.h"

@implementation Currency
{
    int _amount;
}

- (instancetype)initWithAmount:(int)amount{
    
    self = [super init];
    if (self) {
        _amount = amount;
    }
    return self;
}


- (int)getAmount{
    return _amount;
}



@end
