//
//  ViewController.m
//  LSPDemo1
//
//  Created by J_Knight_ on 2018/9/1.
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
    
    double rectArea = [self calculateAreaOfRect:rect];//output:200
    
    
    
    Square *square = [[Square alloc] init];
    square.width = 10;
    square.height = 20;
    
    double squareArea = [self calculateAreaOfRect:square];//output:400

    
}

- (double)calculateAreaOfRect:(Rectangle *)rect{
    return rect.getArea;
}



@end
