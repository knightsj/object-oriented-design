//
//  StateEating.m
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "StateEating.h"

@implementation StateEating

- (void)wakeUp{
    
    NSLog(@"Already awake, can not change state to awake again");
}


- (void)startCoding{
    
    NSLog(@"New idea came out! change state from eating to coding");
    [_coder setState:(State *)[_coder stateCoding]];
}

- (void)startEating{
    
    NSLog(@"Already eating, can not change state to eating again");
}


- (void)fallAsleep{
    
    NSLog(@"Too tired, change state from eating to sleeping");
    [_coder setState:(State *)[_coder stateSleeping]];
}



@end
