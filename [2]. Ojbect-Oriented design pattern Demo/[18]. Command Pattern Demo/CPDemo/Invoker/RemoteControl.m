//
//  RemoteControl.m
//  CPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "RemoteControl.h"

#import "Command.h"


@implementation RemoteControl
{
    Command *_command;
}


- (void)setCommand:(Command *)command{
    
    _command = command;
}

- (void)pressButton{
    
    [_command excute];
}

@end
