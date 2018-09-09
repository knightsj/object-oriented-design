//
//  ViewController.m
//  LODDemo2
//
//  Created by J_Knight_ on 2018/8/26.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Car *car = [[Car alloc] init];
    NSString *engineBrand = [car usingEngineBrandName];    
}

- (NSString *)findCarEngineBrandName:(Car *)car{
    
    NSString *engineBrandName = [car usingEngineBrandName]; //直接获取到了引擎的品牌名称
    return engineBrandName;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
