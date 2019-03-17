//
//  DispenseChain.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "DispenseChainNode.h"

@implementation DispenseChainNode

- (void)setNextChainNode:(DispenseChainNode *)chainNode{
    
    _nextChainNode = chainNode;
}

- (void)dispense:(int)amount{
    
    return;
}

@end
