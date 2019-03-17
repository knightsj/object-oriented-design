//
//  CommandLightOff.h
//  CPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Command.h"

@class Light;
NS_ASSUME_NONNULL_BEGIN

@interface CommandLightOff : Command

- (instancetype)initWithLight:(Light *)light;

@end

NS_ASSUME_NONNULL_END
