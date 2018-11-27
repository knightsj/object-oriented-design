//
//  ViewController.m
//  SPDemo
//
//  Created by Sun Shijie on 2018/10/6.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "LogManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    LogManager *manager0 = [[LogManager alloc] init];
    
    LogManager *manager1 = [LogManager sharedInstance];
    
    LogManager *manager2 = [manager0 copy];
    
    LogManager *manager3 = [manager1 mutableCopy];
    
    NSLog(@"\nalloc&init:     %p\nsharedInstance: %p\ncopy:           %p\nmutableCopy:    %p",manager0,manager1,manager2,manager3);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
