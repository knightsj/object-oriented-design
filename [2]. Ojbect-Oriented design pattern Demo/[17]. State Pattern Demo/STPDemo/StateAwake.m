//
//  StateAwake.m
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "StateAwake.h"

//
//@property (nonatomic, strong) StateAwake *stateAwake;
//@property (nonatomic, strong) StateCoding *stateCoding;
//@property (nonatomic, strong) StateEating *stateEating;
//@property (nonatomic, strong) StateSleeping *stateSleeping;


@implementation StateAwake

- (void)wakeUp{
    
    NSLog(@"Already awake, can not change state to awake again");
}

- (void)startCoding{
    
    NSLog(@"Change state from awake to coding");
    [_coder setState:(State *)[_coder stateCoding]];
}

- (void)startEating{
    
    NSLog(@"Change state from awake to eating");
    [_coder setState:(State *)[_coder stateEating]];
}


- (void)fallAsleep{
    
    NSLog(@"Change state from awake to sleeping");
    [_coder setState:(State *)[_coder stateSleeping]];
}

@end
