//
//  ViewController.m
//  CRPDemo2
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "DispenseChainNode.h"
#import "ATMDispenseChain.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *dispenseNodes = @[@(50),@(20),@(10)];
    NSArray *dispenseNodeValues = @[@(100),@(50),@(20),@(10)];
    ATMDispenseChain *atm = [[ATMDispenseChain alloc] initWithDispenseNodeValues:dispenseNodeValues];
    
    [atm dispense:230];
    
    [atm dispense:70];
    
    [atm dispense:40];
    
    [atm dispense:10];
    
    [atm dispense:8];
}


@end
