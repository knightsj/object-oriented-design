//
//  DispenseChain.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "DispenseChainNode.h"

@implementation DispenseChainNode

- (instancetype)initWithDispenseValue:(int)dispenseValue
{
    self = [super init];
    if (self) {
        _dispenseValue = dispenseValue;
    }
    return self;
}

- (void)setNextChainNode:(DispenseChainNode *)chainNode{
    
    _nextChainNode = chainNode;
}

- (void)dispense:(int)amount{
    
    if (amount >= _dispenseValue) {
        
        int count = amount/_dispenseValue;
        int remainder = amount % _dispenseValue;
        
        NSLog(@"Dispensing %d of %d",count,_dispenseValue);
        
        if (remainder != 0) {
            [_nextChainNode dispense:remainder];
        }
        
    }else{
        
        [_nextChainNode dispense:amount];
    }
}

@end
