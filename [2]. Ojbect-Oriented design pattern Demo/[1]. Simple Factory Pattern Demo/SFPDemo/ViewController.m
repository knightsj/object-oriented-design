//
//  ViewController.m
//  SFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "PhoneFactory.h"
#import "Store.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    Store *phoneStore = [[Store alloc] init];
    
    //phoneStore wants to sell iPhone
    
    //1. create phone
    Phone *iPhone = [PhoneFactory  createPhoneWithTag:@"i"];
    
    //2. package phone to store
    [iPhone packaging];
    
    //3. store sells phone after receving it
    [phoneStore sellPhone:iPhone];
    
    
    //phoneStore wants to sell MIPhone
    Phone *miPhone = [PhoneFactory  createPhoneWithTag:@"MI"];
    [miPhone packaging];
    [phoneStore sellPhone:miPhone];
    
    
    //phoneStore wants to sell HWPhone
    Phone *hwPhone = [PhoneFactory  createPhoneWithTag:@"HW"];
    [hwPhone packaging];
    [phoneStore sellPhone:hwPhone];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
