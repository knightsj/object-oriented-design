
```objc
//================== Rectangle.h ==================

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

@interface Square : Rectangle
@end



//================== Square.m ==================

@implementation Square

- (void)setWidth:(double)width{
    
    _width = width;
    _height = width;
}

- (void)setHeight:(double)height{
    
    _width = height;
    _height = height;
}

@end
```
