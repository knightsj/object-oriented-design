//
//  Quadrangle.h
//  LSPDemo2
//
//  Created by J_Knight_ on 2018/9/2.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quadrangle : NSObject
{
@protected double _width;
@protected double _height;
}

- (void)setWidth:(double)width;
- (void)setHeight:(double)height;

- (double)width;
- (double)height;

- (double)getArea;

@end
