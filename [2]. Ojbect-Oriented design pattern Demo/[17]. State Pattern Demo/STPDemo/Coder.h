//
//  Coder.h
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ActionProtocol.h"

@class State;
@class StateAwake;
@class StateCoding;
@class StateEating;
@class StateSleeping;

@interface Coder : NSObject<ActionProtocol>

@property (nonatomic, strong) StateAwake *stateAwake;
@property (nonatomic, strong) StateCoding *stateCoding;
@property (nonatomic, strong) StateEating *stateEating;
@property (nonatomic, strong) StateSleeping *stateSleeping;

- (void)setState:(State *)state;

@end

