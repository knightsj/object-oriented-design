//
//  Rectangle.h
//  LSPDemo1
//
//  Created by J_Knight_ on 2018/9/1.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject
{
@protected double _width;
@protected double _height;
}

//设置宽高
- (void)setWidth:(double)width;
- (void)setHeight:(double)height;

//获取宽高
- (double)width;
- (double)height;

//获取面积
- (double)getArea;

@end
