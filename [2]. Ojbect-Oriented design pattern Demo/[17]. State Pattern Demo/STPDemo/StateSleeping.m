//
//  StateSleeping.m
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "StateSleeping.h"

@implementation StateSleeping

- (void)wakeUp{
    
    NSLog(@"Change state from sleeping to awake");
    [_coder setState:(State *)[_coder stateAwake]];
}


- (void)startCoding{
    
    NSLog(@"Already sleeping, can not change state to coding");
}

- (void)startEating{
    
    NSLog(@"Already sleeping, can change state to eating");
}


- (void)fallAsleep{
    
    NSLog(@"Already sleeping, can not change state to sleeping again");
}

@end
