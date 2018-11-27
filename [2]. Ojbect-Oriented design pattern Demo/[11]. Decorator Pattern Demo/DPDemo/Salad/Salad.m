//
//  Salad.m
//  DPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "Salad.h"

@implementation Salad

- (NSString *)getDescription{
    return @"";
}

- (double)price{
    return 0.0;
}


- (NSString *)description{
    return [NSString stringWithFormat:@"This salad is: %@ and the price is: %.2lf",[self getDescription],[self price]];
}
@end
