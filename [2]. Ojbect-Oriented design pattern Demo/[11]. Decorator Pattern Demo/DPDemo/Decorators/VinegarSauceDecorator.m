//
//  VinegarSauceDecorator.m
//  DPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "VinegarSauceDecorator.h"

@implementation VinegarSauceDecorator

- (NSString *)getDescription{
    return [NSString stringWithFormat:@"%@ + vinegar sauce",[self.salad getDescription]];
}

- (double)price{
    return [self.salad price] + 2.0;
}

@end
