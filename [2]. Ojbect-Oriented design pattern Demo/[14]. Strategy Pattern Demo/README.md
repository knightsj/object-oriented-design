# 策略模式代码示例

首先我们定义好抽象策略类和具体策略类：

因为是针对两个整数的操作，所以在抽象策略类中，我们只需定义一个传入两个整数的接口即可。

抽象策略类``TwoIntOperation``:

```objc
//================== TwoIntOperation.h ==================

@interface TwoIntOperation : NSObject

- (int)operationOfInt1:(int)int1 int2:(int)int2;

@end



//================== TwoIntOperation.m ==================

@implementation  TwoIntOperation

- (int)operationOfInt1:(int)int1 int2:(int)int2{
    
    //implenting by sub classes;
    return 0;
}

@end
```

接着我们根据加减乘除四种运算，来分别定义四个具体策略类：

加法``TwoIntOperationAdd``：

```objc
//================== TwoIntOperationAdd.h ==================

@interface TwoIntOperationAdd : TwoIntOperation

@end



//================== TwoIntOperationAdd.m ==================

@implementation TwoIntOperationAdd

- (int)operationOfInt1:(int)int1 int2:(int)int2{
    
    NSLog(@"==== adding ====");
    
    return int1 + int2;
}

@end
```

减法``TwoIntOperationSubstract``：
```objc
//================== TwoIntOperationSubstract.h ==================

@interface TwoIntOperationSubstract : TwoIntOperation

@end



//================== TwoIntOperationSubstract.m ==================

@implementation TwoIntOperationSubstract

- (int)operationOfInt1:(int)int1 int2:(int)int2{
    
    NSLog(@"==== Substract ====");
    return int1 - int2;
}
@end
```

乘法``TwoIntOperationMultiply``:
```objc
//================== TwoIntOperationMultiply.h ==================

@interface TwoIntOperationMultiply : TwoIntOperation

@end



//================== TwoIntOperationMultiply.m ==================

@implementation TwoIntOperationMultiply

- (int)operationOfInt1:(int)int1 int2:(int)int2{
    
    NSLog(@"==== multiply ====");
    
    return int1 * int2;
}

@end
```

除法``TwoIntOperationDivision``:

```objc
//================== TwoIntOperationDivision.h ==================

@interface TwoIntOperationDivision : TwoIntOperation

@end



//================== TwoIntOperationDivision.m ==================

@implementation TwoIntOperationDivision

- (int)operationOfInt1:(int)int1 int2:(int)int2{
    
    NSLog(@"==== division ====");
    return int1/int2;
}

@end
```

现在关于算法的类都声明好了，我们最后声明一下 ``Context`` 类：


```objc
//================== Context.h ==================

@interface Context : NSObject

- (instancetype)initWithOperation: (TwoIntOperation *)operation;

- (void)setOperation:(TwoIntOperation *)operation;

- (int)excuteOperationOfInt1:(int)int1 int2:(int)int2;

@end



//================== Context.m ==================

@implementation Context
{
    TwoIntOperation *_operation;
}

- (instancetype)initWithOperation: (TwoIntOperation *)operation{

    self = [super init];
    if (self) {
        //injection from instane initialization
        _operation = operation;
    }
    return self;
}

- (void)setOperation:(TwoIntOperation *)operation{
    
    //injection from setting method
    _operation = operation;
}

- (int)excuteOperationOfInt1:(int)int1 int2:(int)int2{
    
    //return value by constract strategy instane
    return [_operation operationOfInt1:int1 int2:int2];
}

@end
```

``Context``类在构造器（init方法）注入了一个具体策略实例并持有它，而且``Context``也提供了``set``方法，让外部注入进来具体策略类的实例。

而策略的具体执行是通过``Context``的接口``excuteOperationOfInt1:int2``。这个接口是提供给客户端调用的；而且在它的内部其实调用的是当前持有的策略实例的执行策略的方法。

所以如果想使用哪种策略，只要将具体策略的实例传入到``Context``实例即可。

现在所有的类都定义好了，下面我们看一下具体如何使用：

```objc
int int1 = 6;
int int2 = 3;
    
NSLog(@"int1: %d    int2: %d",int1,int2);
    
//Firstly, using add operation
TwoIntOperationAdd *addOperation = [[TwoIntOperationAdd alloc] init];
Context *ct = [[Context alloc] initWithOperation:addOperation];
int res1 = [ct excuteOperationOfInt1:int1 int2:int2];
NSLog(@"result of adding : %d",res1);
    
//Changing to multiple operation
TwoIntOperationMultiply *multiplyOperation = [[TwoIntOperationMultiply alloc] init];
[ct setOperation:multiplyOperation];
int res2 = [ct excuteOperationOfInt1:int1 int2:int2];
NSLog(@"result of multiplying : %d",res2);
    
    
//Changing to substraction operation
TwoIntOperationSubstract *subOperation = [[TwoIntOperationSubstract alloc] init];
[ct setOperation:subOperation];
int res3 = [ct excuteOperationOfInt1:int1 int2:int2];
NSLog(@"result of substracting : %d",res3);
    
    
//Changing to division operation
TwoIntOperationDivision *divisionOperation = [[TwoIntOperationDivision alloc] init];
[ct setOperation:divisionOperation];
int res4 = [ct excuteOperationOfInt1:int1 int2:int2];
NSLog(@"result of dividing : %d",res4);
```

看一下日至输出：
```
[13431:1238320] int1: 6    int2: 3
[13431:1238320] ==== adding ====
[13431:1238320] result of adding : 9
[13431:1238320] ==== multiply ====
[13431:1238320] result of multiplying : 18
[13431:1238320] ==== Substract ====
[13431:1238320] result of substracting : 3
[13431:1238320] ==== division ====
[13431:1238320] result dividing : 2
```

在上面的例子中，首先我们要使用加法，所以 实例化了加法策略类并传入到了``Context``类的构造器中。

而后续的乘法，减法，除法的更换，则是分别将它们的策略实例传入到了``Context``的set方法中，并执行即可。
