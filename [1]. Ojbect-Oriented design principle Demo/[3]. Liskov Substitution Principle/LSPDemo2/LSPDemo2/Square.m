//
//  Square.m
//  LSPDemo1
//
//  Created by J_Knight_ on 2018/9/1.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "Square.h"

@implementation Square

-(void)setSideLength:(double)sideLength{    
    _sideLength = sideLength;
}

-(double)sideLength{
    return _sideLength;
}

- (void)setWidth:(double)width{
    _sideLength = width;
}

- (void)setHeight:(double)height{
    _sideLength = height;
}

- (double)width{
    return _sideLength;
}

- (double)height{
    return _sideLength;
}


- (double)getArea{
    return _sideLength * _sideLength;
}


@end
