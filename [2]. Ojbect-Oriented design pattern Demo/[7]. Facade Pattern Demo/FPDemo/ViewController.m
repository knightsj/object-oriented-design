//
//  ViewController.m
//  FPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "HomeDeviceManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HomeDeviceManager *manager = [[HomeDeviceManager alloc] init];
    
    //吹凉风
    [manager coolWind];
    
    //听音乐
    [manager playMusic];
    
    //关掉音乐
    [manager offMusic];
    
    //看电影
    [manager playMovie];
    
    //出门，关闭所有家用电器
    [manager allDeviceOff];
}


@end
