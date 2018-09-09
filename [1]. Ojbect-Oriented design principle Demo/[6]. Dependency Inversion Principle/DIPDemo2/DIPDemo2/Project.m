//
//  Project.m
//  DIPDemo1
//
//  Created by J_Knight_ on 2018/8/25.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "Project.h"
#import "FrondEndDeveloper.h"
#import "BackEndDeveloper.h"

@implementation Project
{
    NSArray <id <DeveloperProtocol>>* _developers;
}


- (instancetype)initWithDevelopers:(NSArray <id <DeveloperProtocol>>*)developers{
    
    if (self = [super init]) {
        _developers = developers;
    }
    return self;
    
}


- (void)startDeveloping{
    
    [_developers enumerateObjectsUsingBlock:^(id<DeveloperProtocol>  _Nonnull developer, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [developer writeCode];
    }];
    
}

@end
