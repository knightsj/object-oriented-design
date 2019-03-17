//
//  ViewController.m
//  CPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"

#import "RemoteControl.h"
#import "CommandLightOn.h"
#import "CommandLightOff.h"
#import "Light.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    //init Light and CommandOn instance
    //inject light instance into commandon instance
    Light *light = [[Light alloc] init];
    CommandLightOn *co = [[CommandLightOn alloc] initWithLight:light];
    
    //set commandon instance into remote control instance
    RemoteControl *rm = [[RemoteControl alloc] init];
    [rm setCommand:co];
    
    //excute command
    [rm pressButton];
    
    //change to off command
    //inject light instance into commandoff instance
    CommandLightOff *cf = [[CommandLightOff alloc] initWithLight:light];
    [rm setCommand:cf];
    [rm pressButton];
}


@end
