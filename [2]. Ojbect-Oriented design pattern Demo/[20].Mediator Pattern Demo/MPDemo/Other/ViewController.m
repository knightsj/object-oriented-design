//
//  ViewController.m
//  MPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "ViewController.h"

#import "User.h"
#import "ChatMediator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    ChatMediator *cm = [[ChatMediator alloc] init];
    
    User *user1 = [[User alloc] initWithName:@"Jack" mediator:cm];
    User *user2 = [[User alloc] initWithName:@"Bruce" mediator:cm];
    User *user3 = [[User alloc] initWithName:@"Lucy" mediator:cm];
    
    [cm addUser:user1];
    [cm addUser:user2];
    [cm addUser:user3];
    
    [user1 sendMessage:@"happy"];
    [user2 sendMessage:@"new"];
    [user3 sendMessage:@"year"];
}

@end
