//
//  StateCoding.m
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "StateCoding.h"

@implementation StateCoding

- (void)wakeUp{
    
    NSLog(@"Already awake, can not change state to awake again");
}


- (void)startCoding{
    
    NSLog(@"Already coding, can not change state to coding again");
}

- (void)startEating{
    
    NSLog(@"Too hungry, change state from coding to eating");
    [_coder setState:(State *)[_coder stateEating]];
}


- (void)fallAsleep{
    
    NSLog(@"Too tired, change state from coding to sleeping");
    [_coder setState:(State *)[_coder stateSleeping]];
}

@end
