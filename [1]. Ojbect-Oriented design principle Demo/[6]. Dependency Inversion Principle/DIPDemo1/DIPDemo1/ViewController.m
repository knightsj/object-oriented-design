//
//  ViewController.m
//  DIPDemo1
//
//  Created by J_Knight_ on 2018/8/25.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "ViewController.h"
#import "Project.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Project *project = [[Project alloc] init];
    [project startDeveloping];
}



@end
