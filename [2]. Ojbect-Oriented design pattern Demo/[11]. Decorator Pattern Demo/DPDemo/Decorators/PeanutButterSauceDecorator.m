//
//  PeanutButterSauceDecorator.m
//  DPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "PeanutButterSauceDecorator.h"

@implementation PeanutButterSauceDecorator

- (NSString *)getDescription{
    return [NSString stringWithFormat:@"%@ + peanut butter sauce",[self.salad getDescription]];
}

- (double)price{
    return [self.salad price] + 4.0;
}

@end
