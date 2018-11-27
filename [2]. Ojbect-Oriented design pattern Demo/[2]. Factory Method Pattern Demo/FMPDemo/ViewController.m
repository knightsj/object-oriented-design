//
//  ViewController.m
//  FMPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "ViewController.h"


#import "IPhoneFactory.h"
#import "MIPhoneFactory.h"
#import "HWPhoneFactory.h"
#import "Store.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Store *phoneStore = [[Store alloc] init];
    
    //phoneStore wants to sell iphone
    Phone *iphone = [IPhoneFactory  createPhone];
    [iphone packaging];
    [phoneStore sellPhone:iphone];
    
    
    //phoneStore wants to sell MIPhone
    Phone *miPhone = [MIPhoneFactory createPhone];
    [miPhone packaging];
    [phoneStore sellPhone:miPhone];
    
    
    //phoneStore wants to sell HWPhone
    Phone *hwPhone = [HWPhoneFactory createPhone];
    [hwPhone packaging];
    [phoneStore sellPhone:hwPhone];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
