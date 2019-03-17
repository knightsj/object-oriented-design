//
//  ViewController.m
//  SPDemo
//
//  Created by Sun Shijie on 2019/2/28.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "Context.h"
#import "TwoIntOperationAdd.h"
#import "TwoIntOperationSubstract.h"
#import "TwoIntOperationMultiply.h"
#import "TwoIntOperationDivision.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int int1 = 6;
    int int2 = 3;
    
    NSLog(@"int1: %d    int2: %d",int1,int2);
    
    //Firstly, using add operation
    TwoIntOperationAdd *addOperation = [[TwoIntOperationAdd alloc] init];
    Context *ct = [[Context alloc] initWithOperation:addOperation];
    int res1 = [ct excuteOperationOfInt1:int1 int2:int2];
    NSLog(@"result of adding : %d",res1);
    
    //Changing to multiple operation
    TwoIntOperationMultiply *multiplyOperation = [[TwoIntOperationMultiply alloc] init];
    [ct setOperation:multiplyOperation];
    int res2 = [ct excuteOperationOfInt1:int1 int2:int2];
    NSLog(@"result of multiplying : %d",res2);
    
    
    //Changing to substraction operation
    TwoIntOperationSubstract *subOperation = [[TwoIntOperationSubstract alloc] init];
    [ct setOperation:subOperation];
    int res3 = [ct excuteOperationOfInt1:int1 int2:int2];
    NSLog(@"result of substracting : %d",res3);
    
    
    //Changing to division operation
    TwoIntOperationDivision *divisionOperation = [[TwoIntOperationDivision alloc] init];
    [ct setOperation:divisionOperation];
    int res4 = [ct excuteOperationOfInt1:int1 int2:int2];
    NSLog(@"result of dividing : %d",res4);
    
}


@end
