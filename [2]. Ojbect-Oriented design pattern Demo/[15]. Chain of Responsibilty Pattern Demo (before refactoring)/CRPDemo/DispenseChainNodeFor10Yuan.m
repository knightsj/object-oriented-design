//
//  DispenseChainFor10Dollar.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "DispenseChainNodeFor10Yuan.h"

@implementation DispenseChainNodeFor10Yuan

- (void)dispense:(int)amount{
    
    int unit = 10;
    
    if (amount >= unit) {
        
        int count = amount/unit;
        int remainder = amount % unit;
        
        NSLog(@"Dispensing %d of %d",count,unit);
        
        if (remainder != 0) {
            [_nextChainNode dispense:remainder];
        }
        
    }else{
        
        [_nextChainNode dispense:amount];
    }
}


@end
