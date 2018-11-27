//
//  Director.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/10/5.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "Director.h"

@implementation Director
{
    Builder *_builder;
}


- (void)constructPhoneWithBuilder:(Builder *)builder{
    
    _builder = builder;
    
    [_builder buildCPU];
    [_builder buildCapacity];
    [_builder buildDisplay];
    [_builder buildCamera];
    
}



- (Phone *)obtainPhone{
    
    return [_builder obtainPhone];
}


@end
