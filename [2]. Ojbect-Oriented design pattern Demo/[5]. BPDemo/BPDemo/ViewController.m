//
//  ViewController.m
//  BPDemo
//
//  Created by Sun Shijie on 2018/10/5.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "Director.h"
#import "IPhoneXRBuilder.h"
#import "MI8Builder.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //get iPhoneXR phone
    //1. A director instance
    Director *director = [[Director alloc] init];
    
    //2. A builder instance
    IPhoneXRBuilder *iphoneXRBuilder = [[IPhoneXRBuilder alloc] init];
    
    //3. Builder create the corresponding phone
    [iphoneXRBuilder createPhone];
    
    //4. construct phone by director
    [director constructPhoneWithBuilder:iphoneXRBuilder];
    
    //5. get phone by builder
    Phone *iPhoneXR = [director obtainPhone];
    NSLog(@"Get new phone iPhoneXR of data: %@",iPhoneXR);
    
    
    //get MI8 phone
    MI8Builder *mi8Builder = [[MI8Builder alloc] init];
    [mi8Builder createPhone];
    [director constructPhoneWithBuilder:mi8Builder];
    Phone *mi8 = [director obtainPhone];
    NSLog(@"Get new phone MI8      of data: %@",mi8);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
