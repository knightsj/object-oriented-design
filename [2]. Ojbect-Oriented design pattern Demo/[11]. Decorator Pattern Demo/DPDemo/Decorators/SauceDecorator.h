//
//  SauceDecorator.h
//  DPDemo
//
//  Created by Sun Shijie on 2018/11/3.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "Salad.h"

@interface SauceDecorator : Salad

@property (nonatomic, strong) Salad *salad;

- (instancetype)initWithSalad:(Salad *)salad;

@end


