//
//  Square.h
//  LSPDemo1
//
//  Created by J_Knight_ on 2018/9/1.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "Quadrangle.h"

@interface Square : Quadrangle
{
    @protected double _sideLength;
}

-(void)setSideLength:(double)sideLength;

-(double)sideLength;

@end
