//
//  DispenseChainFor50Dollar.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "DispenseChainNodeFor50Yuan.h"

@implementation DispenseChainNodeFor50Yuan


- (void)dispense:(int)amount{
    
    int unit = 50;
    
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
