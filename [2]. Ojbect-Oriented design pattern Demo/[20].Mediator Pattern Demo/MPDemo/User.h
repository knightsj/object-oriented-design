//
//  User.h
//  MPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChatMediator;

@interface User : NSObject

- (instancetype)initWithName:(NSString *)name mediator:(ChatMediator *)mediator;

- (void)sendMessage:(NSString *)message;

- (void)receivedMessage:(NSString *)message;

@end

