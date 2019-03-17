//
//  ATMDispenseChain.h
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DispenseProtocol.h"

@interface ATMDispenseChain : NSObject<DispenseProtocol>

- (instancetype)initWithDispenseNodeValues:(NSArray *)nodeValues;

@end


