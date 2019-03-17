# 观察者模式代码示例


首先我们定义观察者``Observer``:

```objc
//================== Observer.h ==================

@interface Observer : NSObject
{
    @protected Subject *_subject;
}

- (instancetype)initWithSubject:(Subject *)subject;

- (void)update;

@end



//================== Observer.m ==================

@implementation Observer

- (instancetype)initWithSubject:(Subject *)subject{
    
    self = [super init];
    if (self) {
        _subject = subject;
       [_subject addObserver:self];
    }
    return self;
}

- (void)update{
    
    NSLog(@"implementation by subclasses");
}
```

``Observer``类是具体观察者的父类，它声明了一个传入目标类（``Subject``）的构造方法并在构造方法里持有这个传入的实例。而且在这个构造方法里，调用了``Subject``的‘添加观察者’的方法，即``addObserver:``,目的是将当前的观察者实例放入``Subject``的用来保存观察者实例的集合中（具体操作可以在下面讲解``Subject``类的部分看到）

另外它也定义了``update``方法供子类使用。

下面我们看一下具体观察者类``Investor``:


```objc
//================== Investor.h ==================

@interface Investor : Observer

@end



//================== Investor.m ==================

@implementation Investor

- (void)update{

    float buyingPrice = [_subject getBuyingPrice];
    NSLog(@"investor %p buy stock of price:%.2lf",self,buyingPrice);    
}

@end
```

具体观察者实现了该协议中定义的方法``update``方法，在这个方法里面，首先通过``getBuyingPrice``方法获得到最新的在监听的数据``buyingPrice``，然后再做其他操作。这里为了方便展示，直接使用日至打印出当前的具体观察者实例的内存地址和当前监听的最新值。



下面我们声明一下目标类和具体目标类：

目标类``Subject``

```objc
//================== Subject.h ==================

@interface Subject : NSObject
{
    @protected float _buyingPrice;
    @protected NSMutableArray <Observer *>*_observers;
}

- (void)addObserver:(Observer *) observer;


- (void)removeObserver:(Observer *) observer;


- (void)notifyObservers;


- (void)setBuyingPrice:(float)price;


- (double)getBuyingPrice;


@end




//================== Subject.m ==================

@implementation Subject

- (instancetype)init{
    
    self = [super init];
    if (self) {
        _observers = [NSMutableArray array];
    }
    return self;
}


- (void)addObserver:( Observer * ) observer{
    
    [_observers addObject:observer];
}


- (void)removeObserver:( Observer *) observer{
    
    [_observers removeObject:observer];
}


- (void)notifyObservers{
    
    [_observers enumerateObjectsUsingBlock:^(Observer *  _Nonnull observer, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [observer update];
    }];
}


- (void)setBuyingPrice:(float)price{
    
    _buyingPrice = price;
    
    [self notifyObservers];
}


- (double)getBuyingPrice{
    
    return _buyingPrice;
}


@end
```

目标类持有一个可变数组，用来保存观察自己的观察者们；并且还提供了增加，删除观察者的接口，也提供了通知所有观察者的接口。

而且它持有一个数据``buyingPrice``，这个数据就是让外部观察者观察的数据。尤其注意它向外界提供的``setBuyingPrice:``方法：当外部调用这个方法，也就是要更新``buyingPrice``这个数据时，目标类调用了``notifyObservers``方法来告知当前所有观察自己的观察者们：我更新了。

而``getBuyingPrice``就是用来返回当前的``buyingPrice``的值的，一般是在观察者们收到更新通知后，主动调动这个方法获取的（具体看上面``Investor``类的实现）。

OK，现在抽象目标类定义好了，下面我们看一下具体目标类``FinancialAdviser``：


```objc
//================== FinancialAdviser.h ==================

@interface FinancialAdviser : Subject

@end



//================== FinancialAdviser.m ==================

@implementation FinancialAdviser

@end
```

因为所有的接口的事先已经在``Subject``类定义好了，所以我们只需新建一个我们需要的子类即可（如果有不同于父类的操作的话还是可以按照自己的方式定义）。

下面我们看一下观察者的机制是如何实现的：

```objc
FinancialAdviser *fa = [[FinancialAdviser alloc] init];
    
Investor *iv1 = [[Investor alloc] initWithSubject:fa];
    
NSLog(@"====== first advice ========");
[fa setBuyingPrice:1.3];
    
    
Investor *iv2 = [[Investor alloc] initWithSubject:fa];
Investor *iv3 = [[Investor alloc] initWithSubject:fa];

NSLog(@"====== second advice ========");
[fa setBuyingPrice:2.6];
```

从代码中可以看到，我们最开始向``FinancialAdviser``(具体目标类)添加了一个具体观察者类的实例``iv1``，然后``FinancialAdviser``的实例``fa``便通知了所有观察者（此时的观察者只有``iv1``）。

后面我们继续向``fa``添加了``iv2``和``iv3``后发送通知。此时三个观察者都收到了消息。

在下面的日至输出中也可以看到，内存地址``0x600003094c00``就是``iv1``，``0x600003083680``和``0x600003083690``就是``iv2``和``iv3``。

```
====== first advice ========
investor 0x600003094c00 buy stock of price:1.30
====== second advice ========
investor 0x600003094c00 buy stock of price:2.60
investor 0x600003083680 buy stock of price:2.60
investor 0x600003083690 buy stock of price:2.60
```

