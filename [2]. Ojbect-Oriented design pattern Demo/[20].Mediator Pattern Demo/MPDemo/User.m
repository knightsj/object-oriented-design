//
//  User.m
//  MPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "User.h"
#import "ChatMediator.h"

@implementation User
{
    NSString *_name;
    ChatMediator *_chatMediator;
}

- (instancetype)initWithName:(NSString *)name mediator:(ChatMediator *)mediator{
    
    self = [super init];
    if (self) {
        _name = name;
        _chatMediator = mediator;
    }
    return self;
}

- (void)sendMessage:(NSString *)message{
    
    NSLog(@"================");
    NSLog(@"%@ sent message:%@",_name,message);
    [_chatMediator sendMessage:message fromUser:self];
    
}

- (void)receivedMessage:(NSString *)message{
  
    NSLog(@"%@ has received message:%@",_name,message);
}

@end
