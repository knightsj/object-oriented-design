//
//  CommandLightOff.m
//  CPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "CommandLightOff.h"
#import "Light.h"

@implementation CommandLightOff
{
    Light *_light;
}

- (instancetype)initWithLight:(Light *)light{
    
    self = [super init];
    if (self) {
        _light = light;
    }
    return self;
}

- (void)excute{
    
    [_light lightOff];
}

@end
