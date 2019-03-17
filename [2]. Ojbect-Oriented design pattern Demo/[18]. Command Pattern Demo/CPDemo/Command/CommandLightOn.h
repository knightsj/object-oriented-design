//
//  ConmmandLightOn.h
//  CPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Command.h"
@class Light;


@interface CommandLightOn : Command

- (instancetype)initWithLight:(Light *)light;

@end

