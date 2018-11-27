//
//  Phone.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/10/5.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "Phone.h"

@implementation Phone

- (NSString *)description{
    
    return [NSString stringWithFormat:@" CPU: %@ | Capacity: %@ | Display: %@ | Camera: %@",_cpu,_capacity,_display,_camera];
}
@end
