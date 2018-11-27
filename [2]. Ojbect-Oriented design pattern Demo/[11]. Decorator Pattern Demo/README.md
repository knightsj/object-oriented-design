# 装饰者模式代码示例



### 场景概述

模拟沙拉的制作：沙拉由沙拉底和酱汁两个部分组成，不同的沙拉底和酱汁搭配可以组成不同的沙拉。

| 沙拉底 | 价格 |
| ------ | ---- |
| 蔬菜   | 5    |
| 鸡肉   | 10   |
| 牛肉   | 16   |

| 酱汁   | 价格 |
| ------ | ---- |
| 醋汁   | 2    |
| 花生酱 | 4    |
| 蓝莓酱 | 6    |

> 注意：同一份沙拉底可以搭配多钟酱汁，而且酱汁的份数也可以不止一份。



### 场景分析

因为选择一个沙拉底之后，可以随意添加不同份数和种类的酱汁，也就是在原有的沙拉对象增加新的对象，所以比较适合用装饰者模式来设计：酱汁相当于装饰者，而沙拉底则是被装饰的构件。

下面我们用代码看一下如何实现该场景。

### 代码实现

首先我们定义 抽象构件，也就是沙拉类的基类``Salad``：

```objc
//================== Salad.h ==================

@interface Salad : NSObject

- (NSString *)getDescription;

- (double)price;

@end
```

> ``getDescription``和``price``方法用来描述当前沙拉的配置以及价格（因为随着装饰者的装饰，这两个数据会一直变化）。

下面我们再声明装饰者的基类``SauceDecorator``。按照装饰者设计模式类图，该类是继承于沙拉类的：

```objc
//================== SauceDecorator.h ==================

@interface SauceDecorator : Salad

@property (nonatomic, strong) Salad *salad;

- (instancetype)initWithSalad:(Salad *)salad;

@end

    

//================== SauceDecorator.m ==================
    
@implementation SauceDecorator

- (instancetype)initWithSalad:(Salad *)salad{
    
    self = [super init];
    
    if (self) {
        self.salad = salad;
    }
    return self;
}

@end
```

> 在装饰者的构造方法里面传入``Salad``类的实例，并将它保存下来，目的是为了在装饰它的时候用到。

现在抽象构件和装饰者的基类都创建好了，下面我们创建具体构件和具体装饰者。首先我们创建具体构件：

- 蔬菜沙拉
- 鸡肉沙拉
- 牛肉沙拉

蔬菜沙拉``VegetableSalad``：

```objc
//================== VegetableSalad.h ==================

@interface VegetableSalad : Salad

@end


 
//================== VegetableSalad.m ==================
    
@implementation VegetableSalad

- (NSString *)getDescription{
    return @"[Vegetable Salad]";
}

- (double)price{
    return 5.0;
}

@end
```

> 首先``getDescription``方法返回的是蔬菜沙拉底的描述；然后``price``方法返回的是它所对应的价格。

类似的，我们继续按照价格表来创建鸡肉沙拉底和牛肉沙拉底：

鸡肉沙拉底：

```objc
//================== ChickenSalad.h ==================

@interface ChickenSalad : Salad

@end


    
//================== ChickenSalad.m ==================
@implementation ChickenSalad

- (NSString *)getDescription{
    return @"[Chicken Salad]";
}

- (double)price{
    return 10.0;
}

@end
```

牛肉沙拉底：

```objc
//================== BeefSalad.h ==================

@interface BeefSalad : Salad

@end


    
//================== BeefSalad.m ==================
    
@implementation BeefSalad


- (NSString *)getDescription{
    return @"[Beef Salad]";
}

- (double)price{
    return 16.0;
}

@end
```

现在所有的被装饰者创建好了，下面我们按照酱汁的价格表来创建酱汁类（也就是具体装饰者）：

- 醋汁 
- 花生酱
- 蓝莓酱 

首先看一下醋汁``VinegarSauceDecorator``:

```objc
//================== VinegarSauceDecorator.h ==================

@interface VinegarSauceDecorator : SauceDecorator

@end

    

//================== VinegarSauceDecorator.m ==================    
    
@implementation VinegarSauceDecorator

- (NSString *)getDescription{
    return [NSString stringWithFormat:@"%@ + vinegar sauce",[self.salad getDescription]];
}

- (double)price{
    return [self.salad price] + 2.0;
}

@end
```

> 重写了``getDescription``方法，并添加了自己的装饰，即在原来的描述上增加了`` + vinegar sauce``字符串。之所以可以获取到原有的描述，是因为在构造方法里已经获取了被装饰者的对象（在装饰者基类中定义的方法）。同样地，价格也在原来的基础上增加了自己的价格。

现在我们知道了具体装饰者的设计，以此类推，我们看一下花生酱和蓝莓酱类如何定义：

花生酱``PeanutButterSauceDecorator``类：

```objc
//================== PeanutButterSauceDecorator.h ==================     

@interface PeanutButterSauceDecorator : SauceDecorator

@end


    
//================== PeanutButterSauceDecorator.m ==================     
@implementation PeanutButterSauceDecorator

- (NSString *)getDescription{
    return [NSString stringWithFormat:@"%@ + peanut butter sauce",[self.salad getDescription]];
}

- (double)price{
    return [self.salad price] + 4.0;
}

@end
```

蓝莓酱类``BlueBerrySauceDecorator``:

```objc
//================== BlueBerrySauceDecorator.h ==================     

@interface BlueBerrySauceDecorator : SauceDecorator

@end


 
//================== BlueBerrySauceDecorator.m ==================     
    
@implementation BlueBerrySauceDecorator
    
- (NSString *)getDescription{
    
    return [NSString stringWithFormat:@"%@ + blueberry sauce",[self.salad getDescription]];
}

- (double)price{
    
    return [self.salad price] + 6.0;
}

@end
```

OK，到现在所有的类已经定义好了，为了验证是否实现正确，下面用客户端尝试着搭配几种不同的沙拉吧：

1. 蔬菜加单份醋汁沙拉（7元）
2. 牛肉加双份花生酱沙拉（24元）
3. 鸡肉加单份花生酱再加单份蓝莓酱沙拉（20元）

首先我们看第一个搭配：

```objc
//================== client ==================     

//vegetable salad add vinegar sauce
Salad *vegetableSalad = [[VegetableSalad alloc] init];
NSLog(@"%@",vegetableSalad);

vegetableSalad = [[VinegarSauceDecorator alloc] initWithSalad:vegetableSalad];
NSLog(@"%@",vegetableSalad);
```

第一次打印输出：`` This salad is: [Vegetable Salad] and the price is: 5.00``
第二次打印输出：``This salad is: [Vegetable Salad] + vinegar sauce and the price is: 7.00``

上面代码中，我们首先创建了蔬菜底，然后再让醋汁装饰它（将蔬菜底的实例传入醋汁装饰者的构造方法中）。最后我们打印这个蔬菜底对象，描述和价格和装饰之前的确实发生了变化，说明我们的代码没有问题。

接着我们看第二个搭配：

```objc
//================== client ================== 

//beef salad add two peanut butter sauce:
Salad *beefSalad = [[BeefSalad alloc] init];
NSLog(@"%@",beefSalad);

beefSalad = [[PeanutButterSauceDecorator alloc] initWithSalad:beefSalad];
NSLog(@"%@",beefSalad);

beefSalad = [[PeanutButterSauceDecorator alloc] initWithSalad:beefSalad];
NSLog(@"%@",beefSalad);
```

第一次打印输出：``[Beef Salad] and the price is: 16.00``
第二次打印输出：``[Beef Salad] + peanut butter sauce and the price is: 20.00``
第三次打印输出：``[Beef Salad] + peanut butter sauce + peanut butter sauce and the price is: 24.00``

和上面的代码实现类似，都是先创建沙拉底（这次是牛肉底），然后再添加调料。由于是分两次装饰，所以要再写一次花生酱的装饰代码。对比每次打印的结果和上面的价格表可以看出输出是正确的。

这个例子是加了两次相同的酱汁，最后我们看第三个搭配，加入的是不同的两个酱汁：

```objc
//================== client ================== 

//chiken salad add peanut butter sauce and blueberry sauce
Salad *chikenSalad = [[ChickenSalad alloc] init];
NSLog(@"%@",chikenSalad);

chikenSalad = [[PeanutButterSauceDecorator alloc] initWithSalad:chikenSalad];
NSLog(@"%@",chikenSalad);

chikenSalad = [[BlueBerrySauceDecorator alloc] initWithSalad:chikenSalad];
NSLog(@"%@",chikenSalad);
```

第一次打印输出：``[Chicken Salad] and the price is: 10.00``
第二次打印输出：``[Chicken Salad] + peanut butter sauce and the price is: 14.00``
第三次打印输出：``[Chicken Salad] + peanut butter sauce + blueberry sauce and the price is: 20.00``

对比每次打印的结果和上面的价格表可以看出输出是正确的。

到这里，该场景就模拟结束了。可以试想一下，如果今后加了其他的沙拉底和酱汁的话，只需要分别继承``Salad``类和``SauceDecorator``类就可以了，现有的代码并不需要更改；而且经过不同组合可以搭配出更多种类的沙拉。