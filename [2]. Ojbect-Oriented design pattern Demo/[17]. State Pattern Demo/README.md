# 状态模式代码示例


  首先我们定义状态类：

```objc
//================== State.h ==================

@interface State : NSObject<ActionProtocol>
{
    @protected Coder *_coder;
}

- (instancetype)initWithCoder:(Coder *)coder;

@end



//================== State.m ==================

@implementation State

- (instancetype)initWithCoder:(Coder *)coder{
    
    self = [super init];
    if (self) {
        _coder = coder;
    }
    return self;
}

@end
```

状态类持有一个``coder``，也就是程序员的实例，并遵循了``ActionProtocol``：

```objc
//================== ActionProtocol.h ==================

@protocol ActionProtocol <NSObject>

@optional;

- (void)wakeUp;

- (void)fallAsleep;

- (void)startCoding;

- (void)startEating;

@end
```

``ActionProtocol``定义了程序员的一些动作，这些动作是程序员的日常活动，也是触发状态切换的动作，因此``State``也需要遵循这个协议，因为它的子类需要实现这些操作。

接下来我们看一下``State``的子类，根据上面说的四种状态，我们定义下面四个状态子类：

``StateAwake``:
```objc
//================== StateAwake.h ==================

@interface StateAwake : State

@end

@implementation StateAwake

- (void)wakeUp{
    
    NSLog(@"Already awake, can not change state to awake again");
}

- (void)startCoding{
    
    NSLog(@"Change state from awake to coding");
    [_coder setState:(State *)[_coder stateCoding]];
}

- (void)startEating{
    
    NSLog(@"Change state from awake to eating");
    [_coder setState:(State *)[_coder stateEating]];
}


- (void)fallAsleep{
    
    NSLog(@"Change state from awake to sleeping");
    [_coder setState:(State *)[_coder stateSleeping]];
}

@end
```

``StateSleeping``:
```objc
//================== StateSleeping.h ==================

@interface StateSleeping : State

@end



//================== StateSleeping.m ==================

@implementation StateSleeping

- (void)wakeUp{
    
    NSLog(@"Change state from sleeping to awake");
    [_coder setState:(State *)[_coder stateAwake]];
}


- (void)startCoding{
    
    NSLog(@"Already sleeping, can not change state to coding");
}

- (void)startEating{
    
    NSLog(@"Already sleeping, can change state to eating");
}


- (void)fallAsleep{
    
    NSLog(@"Already sleeping, can not change state to sleeping again");
}

@end
```

``StateEating``:
```objc
//================== StateEating.h ==================

@interface StateEating : State

@end



//================== StateEating.m ==================

@implementation StateEating

- (void)wakeUp{
    
    NSLog(@"Already awake, can not change state to awake again");
}


- (void)startCoding{
    
    NSLog(@"New idea came out! change state from eating to coding");
    [_coder setState:(State *)[_coder stateCoding]];
}

- (void)startEating{
    
    NSLog(@"Already eating, can not change state to eating again");
}


- (void)fallAsleep{
    
    NSLog(@"Too tired, change state from eating to sleeping");
    [_coder setState:(State *)[_coder stateSleeping]];
}



@end
```

"StateCoding":
```objc
//================== StateCoding.h ==================

@interface StateCoding : State

@end



//================== StateCoding.m ==================

@implementation StateCoding

- (void)wakeUp{
    
    NSLog(@"Already awake, can not change state to awake again");
}


- (void)startCoding{
    
    NSLog(@"Already coding, can not change state to coding again");
}

- (void)startEating{
    
    NSLog(@"Too hungry, change state from coding to eating");
    [_coder setState:(State *)[_coder stateEating]];
}


- (void)fallAsleep{
    
    NSLog(@"Too tired, change state from coding to sleeping");
    [_coder setState:(State *)[_coder stateSleeping]];
}

@end
```

从上面的类可以看出，在有些状态之间的转换是失效的，有些是可以的。
比如相同状态的切换是无效的；从 ``sleeping``无法切换到``coding``，但是反过来可以，因为可能写代码累了就直接睡了。

下面我们看一下程序员类的实现：


```objc
//================== Coder.h ==================

@interface Coder : NSObject<ActionProtocol>

@property (nonatomic, strong) StateAwake *stateAwake;
@property (nonatomic, strong) StateCoding *stateCoding;
@property (nonatomic, strong) StateEating *stateEating;
@property (nonatomic, strong) StateSleeping *stateSleeping;

- (void)setState:(State *)state;

@end



//================== Coder.m ==================

@implementation Coder
{
    State *_currentState;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        _stateAwake = [[StateAwake alloc] initWithCoder:self];
        _stateCoding = [[StateCoding alloc] initWithCoder:self];
        _stateEating = [[StateEating alloc] initWithCoder:self];
        _stateSleeping = [[StateSleeping alloc] initWithCoder:self];
        
        _currentState = _stateAwake;
    }
    return self;
}

- (void)setState:(State *)state{
    
    _currentState = state;
}

- (void)wakeUp{
    
    [_currentState wakeUp];
}

- (void)startCoding{
    
    [_currentState startCoding];
}

- (void)startEating{
    
    [_currentState startEating];
}


- (void)fallAsleep{
    
    [_currentState fallAsleep];
}

@end
```

从上面的代码我们可以看到，程序员类持有一个当前的状态的实例，在初始化后默认的状态为``awake``，并对外提供一个``setState:``的方法来切换状态。而且在初始化方法里，我们实例化了所有的状态，目的是在切换状态中时使用，详见具体状态类的方法：

```objc
- (void)startEating{
    
    NSLog(@"Too hungry, change state from coding to eating");
    [_coder setState:(State *)[_coder stateEating]];
}
```

>上面这段代码有点绕，可能需要多看几遍源码才能理解（这里面``[_coder stateEating]``是调用了``coder``的一个``get``方法，返回了``stateEating``这个实例）。

最后，在程序员的动作方法里面，实际上调用的是当前状态对应的方法（这也就是为何程序员类和状态类都要遵循``ActionProtocol``的原因）。

这样，我们的状态类，状态子类，程序员类都声明好了。我们看一下如何使用：

```objc
Coder *coder = [[Coder alloc] init];
    
//change to awake.. failed
[coder wakeUp];//Already awake, can not change state to awake again
    
//change to coding
[coder startCoding];//Change state from awake to coding
    
//change to sleep
[coder fallAsleep];//Too tired, change state from coding to sleeping
    
//change to eat...failed
[coder startEating];//Already sleeping, can change state to eating
    
//change to wake up
[coder wakeUp];//Change state from sleeping to awake

//change wake up...failed
[coder wakeUp];//Already awake, can not change state to awake again
    
//change to eating
[coder startEating];//Change state from awake to eating
    
//change to coding
[coder startCoding];//New idea came out! change state from eating to coding
    
//change to sleep
[coder fallAsleep];//Too tired, change state from coding to sleeping
```

在上面的代码里，我们实例化了一个程序员类，接着不断调用一些触发状态改变的方法。我们把每次状态切换的日至输出注释到了代码右侧，可以看到在一些状态的切换是不允许的：
- 比如从上到下的第一个``[coder wakeUp]``：因为程序员对象初始化后默认是``awake``状态，所以无法切换到相同的状态
- 比如从上到下的第一个``[coder startEating]``:在睡觉时是无法直接切换到``eating``状态；而在后面wake以后，再执行``[coder startEating]``就成功了。


从上面的例子可以看出，使用状态模式不需要去写``if-else``，而且如果今后想添加一个状态，只需要再创建一个状态子类，并在新的状态子类添加好对所有状态的处理，并在之前的状态子类中添加上对新状态的处理即可。即便我们修改了之前定义好的状态子类，但是这样也总比使用庞大的``if-else``要方便多。
