//
//  ViewController.m
//  OPDemo
//
//  Created by Sun Shijie on 2019/3/1.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"

#import "Investor.h"
#import "FinancialAdviser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    FinancialAdviser *fa = [[FinancialAdviser alloc] init];
    
    Investor *iv1 = [[Investor alloc] initWithSubject:fa];
    
    NSLog(@"====== first advice ========");
    [fa setBuyingPrice:1.3];
    
    
    Investor *iv2 = [[Investor alloc] initWithSubject:fa];
    Investor *iv3 = [[Investor alloc] initWithSubject:fa];

    NSLog(@"====== second advice ========");
    [fa setBuyingPrice:2.6];
}


@end
