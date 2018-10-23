//
//  ViewController.m
//  AFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "Store.h"
#import "AppleFactory.h"
#import "MIFactory.h"
#import "HWFactory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     Store *store = [[Store alloc] init];
    
    
    //Store wants to sell macbook
    Computer *macBook = [AppleFactory createComputer];
    [macBook packaging];
    
    [store sellComputer:macBook];
    
    
    //Store wants to sell MIPhone
    Phone *miPhone = [MIFactory createPhone];
    [miPhone packaging];
    
    [store sellPhone:miPhone];
    
    
    //Store wants to sell MateBook
    Computer *mateBook = [HWFactory createComputer];
    [mateBook packaging];
    
    [store sellComputer:mateBook];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
