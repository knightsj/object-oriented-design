# 责任链模式代码示例（重构前）


首先创建抽象处理者``DispenseChainNode``:


```objc
//================== DispenseChainNode.h ==================

@interface DispenseChainNode : NSObject <DispenseProtocol>
{
    @protected DispenseChainNode *_nextChainUnit;
}

- (void)setNextChainUnit:(DispenseChainNode *)chainUnit;

@end



//================== DispenseChainNode.m ==================

@implementation DispenseChainNode

- (void)setNextChainNode:(DispenseChainNode *)chainNode{
    
    _nextChainNode = chainNode;
}

- (void)dispense:(int)amount{
    
    return;
}

@end
```

>- ``DispenseChainNode``是责任链节点，也就是具体处理者的父类，它持有``DispenseChainNode``的实例，用来保存当前节点的下一个节点。这个下一个节点的实例是通过``setNextChainNode:``方法注入进来的
> 而且，``DispenseChainNode``遵循``<DispenseProtocol>``协议，这个协议只有一个方法，就是``dispense:``方法，每个节点都实现这个方法来对输入的金额做处理。（dispense 单词的意思是分配，分发）

现在我们根据需求，创建具体处理者，也就是针对50，20，10面额的具体处理者：

50面额的具体处理者：
```objc
//================== DispenseChainNodeFor50Yuan.h ==================

@interface DispenseChainNodeFor50Yuan : DispenseChainNode

@end



//================== DispenseChainNodeFor50Yuan.m ==================

@implementation DispenseChainNodeFor50Yuan

- (void)dispense:(int)amount{
    
    int unit = 50;
    
    if (amount >= unit) {
        
        int count = amount/unit;
        int remainder = amount % unit;
        
        NSLog(@"Dispensing %d of %d",count,unit);
        
        if (remainder != 0) {
            [_nextChainNode dispense:remainder];
        }
        
    }else{
        
        [_nextChainNode dispense:amount];
    }
}


@end
```


20面额的具体处理者：
```objc
//================== DispenseChainNodeFor20Yuan.h ==================

@interface DispenseChainNodeFor20Yuan : DispenseChainNode

@end



//================== DispenseChainNodeFor20Yuan.m ==================

@implementation DispenseChainNodeFor20Yuan

- (void)dispense:(int)amount{
    
    int unit = 20;
    
    if (amount >= unit) {
        
        int count = amount/unit;
        int remainder = amount % unit;
        
        NSLog(@"Dispensing %d of %d",count,unit);
        
        if (remainder != 0) {
            [_nextChainNode dispense:remainder];
        }
        
    }else{
        
        [_nextChainNode dispense:amount];
    }
}


@end
```


10面额的具体处理者：
```objc
//================== DispenseChainNodeFor10Yuan.h ==================

@interface DispenseChainNodeFor10Yuan : DispenseChainNode

@end



//================== DispenseChainNodeFor10Yuan.m ==================

@implementation DispenseChainNodeFor10Yuan

- (void)dispense:(int)amount{
    
    int unit = 10;
    
    if (amount >= unit) {
        
        int count = amount/unit;
        int remainder = amount % unit;
        
        NSLog(@"Dispensing %d of %d",count,unit);
        
        if (remainder != 0) {
            [_nextChainNode dispense:remainder];
        }
        
    }else{
        
        [_nextChainNode dispense:amount];
    }
}

@end
```

上面三个具体处理者在``dispense:``方法的处理都是类似的：

首先查看当前值是否大于面额
- 如果大于面额
    - 将当前值除以当前面额
        - 如果没有余数，则停止，不作处理
        - 如果有余数，则继续将当前值传递给下一个具体处理者（责任链的下一个节点）
- 如果小于面额：将当前值传递给下一个具体处理者（责任链的下一个节点）

现在我们创建好了三个具体处理者，我们再创建一个ATM类来把这些节点串起来：

```objc
//================== ATMDispenseChain.h ==================

@interface ATMDispenseChain : NSObject<DispenseProtocol>

@end



//================== ATMDispenseChain.m ==================

@implementation ATMDispenseChain
{
    DispenseChainNode *_chainNode;
}

- (instancetype)init{
    
    self = [super init];
    if(self){
        
        DispenseChainNodeFor50Yuan *chainNode50 = [[DispenseChainNodeFor50Yuan alloc] init];
        DispenseChainNodeFor20Yuan *chainNode20 = [[DispenseChainNodeFor20Yuan alloc] init]; 
        DispenseChainNodeFor10Yuan *chainNode10 = [[DispenseChainNodeFor10Yuan alloc] init];
        
         _chainNode = chainNode50;
        [_chainNode setNextChainNode:chainNode20];
        [chainNode20 setNextChainNode:chainNode10];
        
    }
    
    return self;
    
}



- (void)dispense:(int)amount{
    
    NSLog(@"==================================");
    NSLog(@"ATM start dispensing of amount:%d",amount);
    
    if (amount %10 != 0) {
        NSLog(@"Amount should be in multiple of 10");
        return;
    }

    [_chainNode dispense:amount];
    
}

@end
```

``ATMDispenseChain``这个类在初始化的时候就将三个具体处理者并按照50，20，10的顺序连接起来，并持有一个``DispenseChainNode``的指针指向当前的具体处理者（也就是责任链的第一个节点，面额50的具体处理者，因为面额的处理是从50开始的）。

OK，现在我们把三个具体处理者都封装好了，可以看一下如何使用：

```objc
ATMDispenseChain *atm = [[ATMDispenseChain alloc] init];
    
[atm dispense:230];
    
[atm dispense:70];
    
[atm dispense:40];
    
[atm dispense:10];

[atm dispense:8];
```

创建``ATMDispenseChain``的实例后，分别传入一些数值来看一下处理的结果：

```
==================================
ATM start dispensing of amount:230
Dispensing 4 of 50
Dispensing 1 of 20
Dispensing 1 of 10
==================================
ATM start dispensing of amount:70
Dispensing 1 of 50
Dispensing 1 of 20
==================================
ATM start dispensing of amount:40
Dispensing 2 of 20
==================================
ATM start dispensing of amount:10
Dispensing 1 of 10
==================================
ATM start dispensing of amount:8
Amount should be in multiple of 10
```

从日志的输出可以看出，我们的责任链处理是没有问题的，针对每个不同的数值，``ATMDispenseChain``实例都作出了最正确的结果。
