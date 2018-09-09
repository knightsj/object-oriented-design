//
//  Rectangle.m
//  LSPDemo1
//
//  Created by J_Knight_ on 2018/9/1.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (void)setWidth:(double)width{
    _width = width;
}

- (void)setHeight:(double)height{
    _height = height;
}

- (double)width{
    return _width;
}

- (double)height{
    return _height;
}


- (double)getArea{
    return _width * _height;
}



@end
