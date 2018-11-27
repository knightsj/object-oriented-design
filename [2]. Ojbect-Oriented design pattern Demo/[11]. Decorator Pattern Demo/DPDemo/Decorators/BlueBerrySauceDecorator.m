//
//  BlueBerrySauceDecorator.m
//  DPDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "BlueBerrySauceDecorator.h"

@implementation BlueBerrySauceDecorator


- (NSString *)getDescription{
    
    return [NSString stringWithFormat:@"%@ + blueberry sauce",[self.salad getDescription]];
}

- (double)price{
    
    return [self.salad price] + 6.0;
}

@end
