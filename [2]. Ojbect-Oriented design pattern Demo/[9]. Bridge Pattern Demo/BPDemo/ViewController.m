//
//  ViewController.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/11/20.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "ViewController.h"

#import "Rectangle.h"
#import "Square.h"
#import "Circle.h"

#import "RedColor.h"
#import "GreenColor.h"
#import "BlueColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //create 3 shape instances
    Rectangle *rect = [[Rectangle alloc] init];
    Circle *circle = [[Circle alloc] init];
    Square *square = [[Square alloc] init];
    
    //create 3 color instances
    RedColor *red = [[RedColor alloc] init];
    GreenColor *green = [[GreenColor alloc] init];
    BlueColor *blue = [[BlueColor alloc] init];
    
    //rect & red color
    [rect renderColor:red];
    [rect show];
    
    //rect & green color
    [rect renderColor:green];
    [rect show];
    
    
    //circle & blue color
    [circle renderColor:blue];
    [circle show];
    
    //circle & green color
    [circle renderColor:green];
    [circle show];
    
    
    
    //square & blue color
    [square renderColor:blue];
    [square show];
    
    //square & red color
    [square renderColor:red];
    [square show];
}


@end
