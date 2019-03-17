//
//  ViewController.m
//  STPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"

#import "Coder.h"

#import "State.h"
#import "StateAwake.h"
#import "StateCoding.h"
#import "StateEating.h"
#import "StateSleeping.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Coder *coder = [[Coder alloc] init];
    
    //change to awake.. failed
    [coder wakeUp];//Already awake, can not change state to awake again
    
    //change to coding
    [coder startCoding];//Change state from awake to coding
    
    //change to sleep
    [coder fallAsleep];//Too tired, change state from coding to sleeping
    
    //change to eat...failed
    [coder startEating];//Already sleeping, can change state to eating
    
    //change to wake up
    [coder wakeUp];//Change state from sleeping to awake

    //change wake up...failed
    [coder wakeUp];//Already awake, can not change state to awake again
    
    //change to eating
    [coder startEating];//Change state from awake to eating
    
    //change to coding
    [coder startCoding];//New idea came out! change state from eating to coding
    
    //change to sleep
    [coder fallAsleep];//Too tired, change state from coding to sleeping
    
}


@end
