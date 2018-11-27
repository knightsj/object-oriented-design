//
//  ViewController.m
//  DPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "ViewController.h"

#import "BeefSalad.h"
#import "ChickenSalad.h"
#import "VegetableSalad.h"

#import "BlueBerrySauceDecorator.h"
#import "VinegarSauceDecorator.h"
#import "PeanutButterSauceDecorator.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //vegetable salad add vinegar sauce
    Salad *vegetableSalad = [[VegetableSalad alloc] init];
    NSLog(@"%@",vegetableSalad);
    vegetableSalad = [[VinegarSauceDecorator alloc] initWithSalad:vegetableSalad];
    NSLog(@"%@",vegetableSalad);
    
    
    //beef salad add two peanut butter sauce:
    Salad *beefSalad = [[BeefSalad alloc] init];
    NSLog(@"%@",beefSalad);
    beefSalad = [[PeanutButterSauceDecorator alloc] initWithSalad:beefSalad];
    NSLog(@"%@",beefSalad);
    beefSalad = [[PeanutButterSauceDecorator alloc] initWithSalad:beefSalad];
    NSLog(@"%@",beefSalad);
    
    //chiken salad add peanut butter sauce and blueberry sauce
    Salad *chikenSalad = [[ChickenSalad alloc] init];
    NSLog(@"%@",chikenSalad);
    chikenSalad = [[PeanutButterSauceDecorator alloc] initWithSalad:chikenSalad];
    NSLog(@"%@",chikenSalad);
    chikenSalad = [[BlueBerrySauceDecorator alloc] initWithSalad:chikenSalad];
    NSLog(@"%@",chikenSalad);
}


@end
