```objc
//================== Quadrangle.h ==================

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
```



```objc
//================== Rectangle.h ==================

#import "Quadrangle.h"

@interface Rectangle : Quadrangle

@end



//================== Rectangle.m ==================

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
```



```objc
//================== Square.h ==================

@interface Square : Quadrangle
{
    @protected double _sideLength;
}

-(void)setSideLength:(double)sideLength;

-(double)sideLength;

@end



//================== Square.m ==================

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
```
