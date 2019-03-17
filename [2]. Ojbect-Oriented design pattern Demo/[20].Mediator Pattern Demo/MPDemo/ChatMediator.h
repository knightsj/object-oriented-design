//
//  ChatMediator.h
//  MPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface ChatMediator : NSObject


- (void)addUser:(User *)user;

- (void)sendMessage:(NSString *)message fromUser:(User *)user;

@end

