//
//  ATMDispenseChain.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ATMDispenseChain.h"
#import "DispenseChainNode.h"

@implementation ATMDispenseChain
{
    DispenseChainNode *_firstChainNode;
    DispenseChainNode *_finalChainNode;
    int _minimumValue;
}


- (instancetype)initWithDispenseNodeValues:(NSArray *)nodeValues{
    
    self = [super init];
    
    if(self){
        
        NSUInteger length = [nodeValues count];
        
        [nodeValues enumerateObjectsUsingBlock:^(NSNumber * nodeValue, NSUInteger idx, BOOL * _Nonnull stop) {
            
            DispenseChainNode *iterNode = [[DispenseChainNode alloc] initWithDispenseValue:[nodeValue intValue]];
            
            if (idx == length - 1 ) {
                _minimumValue = [nodeValue intValue];
            }
            
            if (!self->_firstChainNode) {
                
                 //because this chain is empty, so the first node and the final node will refer the same node instance
                 self->_firstChainNode =  iterNode;
                 self->_finalChainNode =  self->_firstChainNode;
                
            }else{
                
                //appending the next node, and setting the new final node
                [self->_finalChainNode setNextChainNode:iterNode];
                 self->_finalChainNode = iterNode;
            }
        }];
    }
    
    return self;
}


- (void)dispense:(int)amount{
    
    NSLog(@"==================================");
    NSLog(@"ATM start dispensing of amount:%d",amount);
    
    if (amount % _minimumValue != 0) {
        NSLog(@"Amount should be in multiple of %d",_minimumValue);
        return;
    }

    [ _firstChainNode dispense:amount];
    
}

@end
