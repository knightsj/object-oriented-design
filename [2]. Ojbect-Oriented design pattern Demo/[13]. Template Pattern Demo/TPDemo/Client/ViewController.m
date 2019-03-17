//
//  ViewController.m
//  TPDemo
//
//  Created by Sun Shijie on 2019/3/11.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "HotDrinkTea.h"
#import "HotDrinkLatte.h"
#import "HotDrinkAmericano.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HotDrinkTea *tea = [[HotDrinkTea alloc] init];
    [tea makingProcess];
    
    
    HotDrinkLatte *latte = [[HotDrinkLatte alloc] init];
    [latte makingProcess];
    
    
    HotDrinkAmericano *am = [[HotDrinkAmericano alloc] init];
    [am makingProcess];
    

}


@end
