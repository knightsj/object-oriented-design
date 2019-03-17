//
//  ViewController.m
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "ATMDispenseChain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ATMDispenseChain *atm = [[ATMDispenseChain alloc] init];
    
    [atm dispense:230];
    
    [atm dispense:70];
    
    [atm dispense:40];
    
    [atm dispense:10];

    [atm dispense:8];
    
}


@end
