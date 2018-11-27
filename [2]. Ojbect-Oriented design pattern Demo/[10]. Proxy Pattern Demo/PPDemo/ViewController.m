//
//  ViewController.m
//  PPDemo
//
//  Created by Sun Shijie on 2018/11/19.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "HouseProxy.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HouseProxy *proxy = [[HouseProxy alloc] init];
    [proxy getPayment:100];
}


@end
