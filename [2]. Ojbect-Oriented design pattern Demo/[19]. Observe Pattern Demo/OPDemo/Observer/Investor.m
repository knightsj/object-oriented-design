//
//  Investor.m
//  OPDemo
//
//  Created by Sun Shijie on 2019/3/1.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Investor.h"

@implementation Investor

- (void)update{
    
    float buyingPrice = [_subject getBuyingPrice];
    NSLog(@"investor %p buy stock of price:%.2lf",self,buyingPrice);    
}

@end
