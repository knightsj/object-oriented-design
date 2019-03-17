//
//  StateProtocol.h
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActionProtocol <NSObject>

@optional;

- (void)wakeUp;

- (void)fallAsleep;

- (void)startCoding;

- (void)startEating;


@end

