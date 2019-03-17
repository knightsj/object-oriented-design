//
//  RemoteControl.h
//  CPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Command;


@interface RemoteControl : NSObject

- (void)setCommand:(Command *)command;

- (void)pressButton;


@end


