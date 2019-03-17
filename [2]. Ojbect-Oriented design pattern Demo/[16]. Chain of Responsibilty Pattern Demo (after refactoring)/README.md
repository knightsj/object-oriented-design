# # 责任链模式代码示例（重构后）


首先删除掉三个具体处理者``DispenseChainNodeFor50Yuan``,``DispenseChainNodeFor20Yuan``,``DispenseChainNodeFor10Yuan``。

接着在``DispenseChainNode``添加传入面额值的初始化方法以及面额值的成员变量：


```objc
//================== ADispenseChainNode.h ==================

@interface DispenseChainNode : NSObject <DispenseProtocol>
{
    @protected DispenseChainNode *_nextChainNode;
    @protected int _dispenseValue;
}

- (instancetype)initWithDispenseValue:(int)dispenseValue;

- (void)setNextChainNode:(DispenseChainNode *)chainNode;


@end



//================== ADispenseChainNode.m ==================

@implementation DispenseChainNode

- (instancetype)initWithDispenseValue:(int)dispenseValue
{
    self = [super init];
    if (self) {
        _dispenseValue = dispenseValue;
    }
    return self;
}

- (void)setNextChainNode:(DispenseChainNode *)chainNode{
    
    _nextChainNode = chainNode;
}

- (void)dispense:(int)amount{
    
    if (amount >= _dispenseValue) {
        
        int count = amount/_dispenseValue;
        int remainder = amount % _dispenseValue;
        
        NSLog(@"Dispensing %d of %d",count,_dispenseValue);
        
        if (remainder != 0) {
            [_nextChainNode dispense:remainder];
        }
        
    }else{
        
        [_nextChainNode dispense:amount];
    }
}

@end
```

我们给``DispenseChainNode``添加了``initWithDispenseValue:``方法后，就可以根据需求随意生成不同面额的具体处理者了。

接着我们思考一下之前的``ATMDispenseChain``可以做哪些改变？

既然``DispenseChainNode``可以根据不同的面额值生成处理不同面额的具体处理者实例，那么对于串联多个具体处理者的类``ATMDispenseChain``是不是也可以添加一个注入面额数组的初始化方法呢？比如输入``[50,20,10]``的数组就可以生成50，20，10面额的具体处理者了；而且数组是有序的，传入数组的元素顺序就可以是责任链中节点的顺序。

思路有了，我们看一下具体实现：


```objc
//================== ATMDispenseChain.m ==================

@implementation ATMDispenseChain
{
    DispenseChainNode *_firstChainNode;
    DispenseChainNode *_finalChainNode;
    int _minimumValue;
}


- (instancetype)initWithDispenseNodeValues:(NSArray *)nodeValues{
    
    self = [super init];
    
    if(self){
        
        NSUInteger length = [nodeValues count];
        
        [nodeValues enumerateObjectsUsingBlock:^(NSNumber * nodeValue, NSUInteger idx, BOOL * _Nonnull stop) {
            
            DispenseChainNode *iterNode = [[DispenseChainNode alloc] initWithDispenseValue:[nodeValue intValue]];
            
            if (idx == length - 1 ) {
                _minimumValue = [nodeValue intValue];
            }
            
            if (!self->_firstChainNode) {
                
                 //because this chain is empty, so the first node and the final node will refer the same node instance
                 self->_firstChainNode =  iterNode;
                 self->_finalChainNode =  self->_firstChainNode;
                
            }else{
                
                //appending the next node, and setting the new final node
                [self->_finalChainNode setNextChainNode:iterNode];
                 self->_finalChainNode = iterNode;
            }
        }];
    }
    
    return self;
}


- (void)dispense:(int)amount{
    
    NSLog(@"==================================");
    NSLog(@"ATM start dispensing of amount:%d",amount);
    
    if (amount % _minimumValue != 0) {
        NSLog(@"Amount should be in multiple of %d",_minimumValue);
        return;
    }

    [ _firstChainNode dispense:amount];
    
}

@end
```

重构后的``ATMDispenseChain``类新增了``initWithDispenseNodeValues:``方法，需要从外部传入面额值的数组。在这个方法里面根据传入的数组构造了整条责任链。

而在``dispense:``方法里面则是从责任链的第一个节点来处理面额，并在方法最前面取最小面额的值来做边界处理。

OK，到现在处理者类和责任链类都创建好了，我们看一下如何使用：

```objc
NSArray *dispenseNodeValues = @[@(100),@(50),@(20),@(10)];

ATMDispenseChain *atm = [[ATMDispenseChain alloc] initWithDispenseNodeValues:dispenseNodeValues];
    
[atm dispense:230];
    
[atm dispense:70];
    
[atm dispense:40];
    
[atm dispense:10];
    
[atm dispense:8];
```

是不是感觉简洁多了？我们只需要传入一个面额值的数组即可构造出整条责任链并直接使用。来看一下日至输出：

```
==================================
ATM start dispensing of amount:230
Dispensing 2 of 100
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

从日志的输出结果上看，我们重构后的责任链方案没有问题。
