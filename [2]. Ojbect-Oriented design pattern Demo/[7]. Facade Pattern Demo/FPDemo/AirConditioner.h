//
//  AirConditioner.h
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "HomeDevice.h"



@interface AirConditioner : HomeDevice

//高温模式
- (void)startHighTemperatureMode;

//常温模式
- (void)startMiddleTemperatureMode;

//低温模式
- (void)startLowTemperatureMode;

@end


