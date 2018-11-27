//
//  Shape.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/11/20.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "Shape.h"

@implementation Shape


- (void)renderColor:(Color *)color{
    
    _color = color;
}

- (void)show{
    NSLog(@"Show %@ with %@",[self class],[_color class]);
}
@end
