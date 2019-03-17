//
//  HotDrink.m
//  TPDemo
//
//  Created by Sun Shijie on 2019/3/11.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "HotDrink.h"

@implementation HotDrink


- (void)makingProcess{
    
    NSLog(@" ===== Begin to making %@ ===== ", NSStringFromClass([self class]));
    
    [self prepareHotWater];
    [self addMainMaterial];
    [self addIngredients];
}


- (void)prepareHotWater{
    
    NSLog(@"prepare hot water");
}


- (void)addMainMaterial{
    
    NSLog(@"implemetation by subClasses");
}


- (void)addIngredients{
    
    NSLog(@"implemetation by subClasses");
}



@end
