//
//  ViewController.m
//  DIPDemo2
//
//  Created by J_Knight_ on 2018/8/25.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "ViewController.h"
#import "Project.h"
#import "FrondEndDeveloper.h"
#import "BackEndDeveloper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    FrondEndDeveloper *frontEndDeveloper = [[FrondEndDeveloper alloc] init];
    BackEndDeveloper *backEndDeveloper = [[BackEndDeveloper alloc] init];
    
    Project *project = [[Project alloc] initWithDevelopers:@[frontEndDeveloper,backEndDeveloper]];
    [project startDeveloping];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
