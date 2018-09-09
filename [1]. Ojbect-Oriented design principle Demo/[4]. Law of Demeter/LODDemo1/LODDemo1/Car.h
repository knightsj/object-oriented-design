//
//  Car.h
//  LODDemo1
//
//  Created by J_Knight_ on 2018/8/26.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GasEngine;

@interface Car : NSObject

//构造方法
- (instancetype)initWithEngine:(GasEngine *)engine;

//返回私有成员变量：引擎的实例
- (GasEngine *)usingEngine;

@end
