//
//  ATMDispenseChain.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ATMDispenseChain.h"
#import "DispenseChainNode.h"
#import "DispenseChainNodeFor50Yuan.h"
#import "DispenseChainNodeFor20Yuan.h"
#import "DispenseChainNodeFor10Yuan.h"

@implementation ATMDispenseChain
{
    DispenseChainNode *_chainNode;
}

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        DispenseChainNodeFor50Yuan *chainNode50 = [[DispenseChainNodeFor50Yuan alloc] init];
        DispenseChainNodeFor20Yuan *chainNode20 = [[DispenseChainNodeFor20Yuan alloc] init]; 
        DispenseChainNodeFor10Yuan *chainNode10 = [[DispenseChainNodeFor10Yuan alloc] init];
        
         _chainNode = chainNode50;
        [_chainNode setNextChainNode:chainNode20];
        [chainNode20 setNextChainNode:chainNode10];
        
    }
    
    return self;
    
    
}


- (void)dispense:(int)amount{
    
    NSLog(@"==================================");
    NSLog(@"ATM start dispensing of amount:%d",amount);
    
    if (amount %10 != 0) {
        NSLog(@"Amount should be in multiple of 10");
        return;
    }

    [_chainNode dispense:amount];
    
}

@end
