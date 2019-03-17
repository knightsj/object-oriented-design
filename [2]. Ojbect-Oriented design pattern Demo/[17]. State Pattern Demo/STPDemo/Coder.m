//
//  Coder.m
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Coder.h"

#import "State.h"
#import "StateAwake.h"
#import "StateCoding.h"
#import "StateEating.h"
#import "StateSleeping.h"

@implementation Coder
{
    State *_currentState;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        _stateAwake = [[StateAwake alloc] initWithCoder:self];
        _stateCoding = [[StateCoding alloc] initWithCoder:self];
        _stateEating = [[StateEating alloc] initWithCoder:self];
        _stateSleeping = [[StateSleeping alloc] initWithCoder:self];
        
        _currentState = _stateAwake;
    }
    return self;
}

- (void)setState:(State *)state{
    
    _currentState = state;
}

- (void)wakeUp{
    
    [_currentState wakeUp];
}

- (void)startCoding{
    
    [_currentState startCoding];
}

- (void)startEating{
    
    [_currentState startEating];
}


- (void)fallAsleep{
    
    [_currentState fallAsleep];
}



@end
