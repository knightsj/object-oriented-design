//
//  Contex.m
//  SPDemo
//
//  Created by Sun Shijie on 2019/2/28.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Context.h"
#import "TwoIntOperation.h"

@implementation Context
{
    TwoIntOperation *_operation;
}

- (instancetype)initWithOperation: (TwoIntOperation *)operation{

    self = [super init];
    if (self) {
        //injection from instane initialization
        _operation = operation;
    }
    return self;
}

- (void)setOperation:(TwoIntOperation *)operation{
    
    //injection from setting method
    _operation = operation;
}

- (int)excuteOperationOfInt1:(int)int1 int2:(int)int2{
    
    //return value by constract strategy instane
    return [_operation operationOfInt1:int1 int2:int2];
}



@end
