# 桥接模式代码示例



### 场景概述



创建一些不同的形状，这些形状带有不同的颜色。



三种形状：

- 正方形
- 长方形
- 原型

三种颜色：

- 红色
- 绿色
- 蓝色



### 场景分析

根据上述需求，可能有的朋友会这么设计：

- 正方形
  - 红色正方形
  - 绿色正方形
  - 蓝色正方形
- 长方形
  - 红色长方形
  - 绿色长方形
  - 蓝色长方形
- 圆形
  - 红色圆形
  - 绿色圆形
  - 蓝色圆形

这样的设计确实可以实现上面的需求。但是设想一下，如果后来增加了一种颜色或者形状的话，是不是要多出来很多类？如果形状的种类数是``m``，颜色的种类数是``n``，以这种方式创建的总类数就是 ``m*n``，当m或n非常大的时候，它们相乘的结果就会变得很大。



我们观察一下这个场景：形状和颜色这二者的是没有关联性的，二者可以独立扩展和变化，这样的组合比较适合用桥接模式来做。



根据上面提到的桥接模式的成员：

- 抽象类就是图形的抽象类
- 扩展抽象类就是继承图形抽象类的子类：各种形状
- 实现类接口就是颜色接口
- 具体实现类就是继承颜色接口的类：各种颜色



下面我们用代码看一下该如何设计。



### 代码实现

首先我们创建形状的基类``Shape``：

```objc
//================== Shape.h ==================

@interface Shape : NSObject
{
    @protected Color *_color;
}

- (void)renderColor:(Color *)color;

- (void)show;

@end


    

//================== Shape.m ==================
    
@implementation Shape

- (void)renderColor:(Color *)color{
    
    _color = color;
}

- (void)show{
    NSLog(@"Show %@ with %@",[self class],[_color class]);
}

@end
```

> 由上面的代码可以看出：
>
> - 形状类``Shape``持有``Color``类的实例，二者是以组合的形式结合到一起的。而且``Shape``类定义了供外部传入``Color``实例的方法``renderColor:``：在这个方法里面接收从外部传入的``Color``实例并保存起来。
> - 另外一个公共接口``show``实际上就是打印这个图形的名称及其所搭配的颜色，便于我们后续验证。

接着我们创建三种不同的图形类，它们都继承于``Shape``类：

正方形类：

```objc
//================== Square.h ==================

@interface Square : Shape

@end


    
    
//================== Square.m ==================
    
@implementation Square

- (void)show{
    
    [super show];
}

@end
```

长方形类：

```objc
//================== Rectangle.h ==================

@interface Rectangle : Shape

@end

    
    
    
//================== Rectangle.m ==================
    
@implementation Rectangle

- (void)show{
    
    [super show];
}

@end
```

圆形类：

```objc
//================== Circle.h ==================

@interface Circle : Shape

@end
    

    
    
//================== Circle.m ==================  
    
@implementation Circle

- (void)show{
    
    [super show];
}

@end
```

还记得上面的``Shape``类持有的``Color``类么？它就是所有颜色类的父类：

```objc
//================== Color.h ==================   

@interface Color : NSObject

@end
    
    


//================== Color.m ================== 
    
@implementation Color

@end
```

接着我们创建继承这个``Color``类的三个颜色类：

红色类：

```objc
//================== RedColor.h ==================

@interface RedColor : Color

@end


    
    
//================== RedColor.m ==================  
    
@implementation RedColor

@end
```

绿色类：

```objc
//================== GreenColor.h ==================

@interface GreenColor : Color

@end


    
    
//================== GreenColor.m ==================
@implementation GreenColor

@end
```

蓝色类：

```objc
//================== BlueColor.h ==================

@interface BlueColor : Color

@end


    
 
//================== BlueColor.m ==================
    
@implementation BlueColor

@end
```

OK，到现在所有的形状类和颜色类的相关类已经创建好了，我们看一下客户端是如何使用它们来组合成不同的带有颜色的形状的:

```objc
//================== client ==================


//create 3 shape instances
Rectangle *rect = [[Rectangle alloc] init];
Circle *circle = [[Circle alloc] init];
Square *square = [[Square alloc] init];
    
//create 3 color instances
RedColor *red = [[RedColor alloc] init];
GreenColor *green = [[GreenColor alloc] init];
BlueColor *blue = [[BlueColor alloc] init];
    
//rect & red color
[rect renderColor:red];
[rect show];
    
//rect & green color
[rect renderColor:green];
[rect show];
    
    
//circle & blue color
[circle renderColor:blue];
[circle show];
    
//circle & green color
[circle renderColor:green];
[circle show];
    
    
    
//square & blue color
[square renderColor:blue];
[square show];
    
//square & red color
[square renderColor:red];
[square show];
```

> 上面的代码里，我们先声明了所有的形状类和颜色类的实例，然后自由搭配，形成不同的形状+颜色的组合。



下面我们通过打印的结果来看一下组合的效果：

```
Show Rectangle with RedColor
Show Rectangle with GreenColor
Show Circle with BlueColor
Show Circle with GreenColor
Show Square with BlueColor
Show Square with RedColor
```

从打印的接口可以看出组合的结果是没问题的。



跟上面没有使用桥接模式的设计相比，使用桥接模式需要的类的总和是  ``m + n``：当m或n的值很大的时候是远小于 ``m * n``（没有使用桥接，而是使用继承的方式）的。

而且如果后面还要增加形状和颜色的话，使用桥接模式就可以很方便地将原有的形状和颜色和新的形状和颜色进行搭配了，新的类和旧的类互不干扰。