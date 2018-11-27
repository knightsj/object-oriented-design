# 代理模式代码示例



### 场景概述

在这里举一个买房者通过买房中介买房的例子。

现在一般我们买房子不直接接触房东，而是先接触中介，买房的相关合同和一些事宜可以先和中介进行沟通。



在本例中，我们在这里让买房者直接支付费用给中介，然后中介收取一部分的中介费， 再将剩余的钱交给房东。



### 场景分析



中介作为房东的代理，与买房者直接接触。而且中介还需要在真正交易前做其他的事情（收取中介费，帮买房者check房源的真实性等等），因此该场景比较适合使用代理模式。



根据上面的代理模式的成员：



- 客户端就是买房者

- 代理就是中介
- 真实主题就是房东
- 中介和房东都会实现收钱的方法，我们可以定义一个抽象主题类，它有一个公共接口是收钱的方法。



### 代码实现

首先我们定义一下房东和代理需要实现的接口``PaymentInterface``（在类图里面是继承某个共同对象，我个人比较习惯用接口来做）。

```objc
//================== PaymentInterface.h ==================

@protocol PaymentInterface <NSObject>

- (void)getPayment:(double)money;

@end
```

这个接口声明了中介和房东都需要实现的方法``getPayment:``

接着我们声明代理类``HouseProxy``:

```objc
//================== HouseProxy.h ==================

@interface HouseProxy : NSObject<PaymentInterface>

@end

    


//================== HouseProxy.m ==================
const float agentFeeRatio = 0.35;

@interface HouseProxy()

@property (nonatomic, copy) HouseOwner *houseOwner;

@end

@implementation HouseProxy

- (void)getPayment:(double)money{
    
    double agentFee = agentFeeRatio * money;
    NSLog(@"Proxy get payment : %.2lf",agentFee);
    
    [self.houseOwner getPayment:(money - agentFee)];
}

- (HouseOwner *)houseOwner{
    
    if (!_houseOwner) {
         _houseOwner = [[HouseOwner alloc] init];
    }
    return _houseOwner;
}

@end
```

在``HouseProxy``里面，持有了房东，也就是被代理者的实例。然后在的``getPayment:``方法里，调用了房东实例的``getPayment:``方法。而且我们可以看到，在调用房东实例的``getPayment:``方法，代理先拿到了中介费（中介费比率``agentFeeRatio``定义为0.35，即中介费的比例占35%）。

这里面除了房东实例的``getPayment:``方法之外的一些操作就是代理存在的意义：它可以在真正被代理对象做事情之前，之后做一些其他额外的事情。比如类似AOP编程一样，定义类似的``before***Method``或是``after**Method``方法等等。

最后我们看一下房东是如何实现``getPayment:``方法的：

```objc
//================== HouseOwner.h ==================

@interface HouseOwner : NSObject<PaymentInterface>

@end

    

    
//================== HouseOwner.m ==================
    
@implementation HouseOwner

- (void)getPayment:(double)money{
    
    NSLog(@"House owner get payment : %.2lf",money);
}

@end
```

房东类``HouseOwner``按照自己的方式实现了``getPayment:``方法。

很多时候被代理者（委托者）可以完全按照自己的方式去做事情，而把一些额外的事情交给代理来做，这样可以保持原有类的功能的纯粹性，符合开闭原则。

下面我们看一下客户端的使用以及打印出来的结果：

客户端代码：

```objc
//================== client.m ==================

HouseProxy *proxy = [[HouseProxy alloc] init];
[proxy getPayment:100];
```

> 上面的客户端支付给了中介100元。

下面我们看一下打印结果：

```
Proxy get payment : 35.00
House owner get payment : 65.00

```

和预想的一样，中介费收取了35%的中介费，剩下的交给了房东。