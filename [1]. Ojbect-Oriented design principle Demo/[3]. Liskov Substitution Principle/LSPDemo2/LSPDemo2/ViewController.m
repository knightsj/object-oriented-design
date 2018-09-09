//
//  ViewController.m
//  LSPDemo2
//
//  Created by J_Knight_ on 2018/9/2.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "ViewController.h"
#import "Rectangle.h"
#import "Square.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Rectangle *rect = [[Rectangle alloc] init];
    rect.width = 10;
    rect.height = 20;
    
    double rectArea = rect.width * rect.height;//200
    
    
    
    Square *square = [[Square alloc] init];
    square.width = 10;
    square.height = 20;
    
    double squareArea1 = square.width * square.height;//400
    
    
    square.sideLength = 30;
    
    double squareArea2 = square.width * square.height;//400
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
