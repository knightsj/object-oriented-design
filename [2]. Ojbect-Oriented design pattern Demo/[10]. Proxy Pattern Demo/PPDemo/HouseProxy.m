//
//  HouseProxy.m
//  PPDemo
//
//  Created by Sun Shijie on 2018/11/19.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "HouseProxy.h"
#import "HouseOwner.h"

const float agentFeeRatio = 0.35;

@interface HouseProxy()

@property (nonatomic, copy) HouseOwner *houseOwner;

@end

@implementation HouseProxy

- (void)getPayment:(double)money{
    
    double agentFee = agentFeeRatio * money;
    NSLog(@"Proxy get payment : %.2lf",agentFee);
    
    [self.houseOwner getPayment:(money - agentFee)];
}

- (HouseOwner *)houseOwner{
    
    if (!_houseOwner) {
         _houseOwner = [[HouseOwner alloc] init];
    }
    return _houseOwner;
}

@end
