//
//  ViewController.m
//  ISPDemo2
//
//  Created by J_Knight_ on 2018/8/26.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "ViewController.h"
#import "OnlineClient.h"
#import "TelephoneClient.h"
#import "WalkinClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OnlineClient *olClint = [[OnlineClient alloc] init];
    [olClint placeOrder];
    [olClint payOrder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
