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
    NSArray *_developers;
}


- (instancetype)initWithDevelopers:(NSArray *)developers{
    
    if (self = [super init]) {
        _developers = developers;
    }
    return self;
}



- (void)startDeveloping{
    
    [_developers enumerateObjectsUsingBlock:^(id  _Nonnull developer, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([developer isKindOfClass:[FrondEndDeveloper class]]) {
            
            [developer writeJavaScriptCode];
            
        }else if ([developer isKindOfClass:[BackEndDeveloper class]]){
            
            [developer writeJavaCode];
            
        }else{
            //no such developer
        }
    }];
}

@end
