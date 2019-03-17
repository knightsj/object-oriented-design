# 命令模式代码示例


首先我们创建接收者，灯类：

```objc
//================== Light.h ==================

@interface Light : NSObject

- (void)lightOn;

- (void)lightOff;

@end



//================== Light.m ==================

@implementation Light


- (void)lightOn{
    
    NSLog(@"Light on");
}


- (void)lightOff{
    
    NSLog(@"Light off");
}

@end
```

灯类声明并实现了两个接口：开灯接口和关灯接口，来让外部执行开灯和关灯的操作。

接着我们创建抽象命令类和具体命令类：

抽象命令类：

```objc
//================== Command.h ==================

@interface Command : NSObject

- (void)excute;

@end



//================== Command.m ==================

@implementation Command

@end
```

抽象命令类声明了一个执行命令的接口``excute``，这个接口由它的子类，也就是具体命令类来实现。

因为这里面只有开灯和关灯两种命令，所以我们创建两个具体命令类来继承上面的抽象命令类：

开灯命令``CommandLightOn``：

```objc
//================== CommandLightOn.h ==================

@interface CommandLightOn : Command

- (instancetype)initWithLight:(Light *)light;

@end


//================== CommandLightOn.m ==================

@implementation CommandLightOn
{
    Light *_light;
}

- (instancetype)initWithLight:(Light *)light{
    
    self = [super init];
    if (self) {
        _light = light;
    }
    return self;
}

- (void)excute{
    
    [_light lightOn];
}
```

关灯命令``CommandLightOff``：
```objc
//================== CommandLightOff.h ==================

@interface CommandLightOff : Command

- (instancetype)initWithLight:(Light *)light;

@end



//================== CommandLightOff.m ==================
@implementation CommandLightOff
{
    Light *_light;
}

- (instancetype)initWithLight:(Light *)light{
    
    self = [super init];
    if (self) {
        _light = light;
    }
    return self;
}

- (void)excute{
    
    [_light lightOff];
}
```

>我们可以看到这两个具体命令类分别以自己的方式实现了它们的父类声明的``excute``接口。

最后我们创建链接客户端和接收者的调用者类，也就是遥控器类``RemoteControl``：

```objc
//================== RemoteControl.h ==================

@interface RemoteControl : NSObject

- (void)setCommand:(Command *)command;

- (void)pressButton;

@end



//================== RemoteControl.m ==================

@implementation RemoteControl
{
    Command *_command;
}


- (void)setCommand:(Command *)command{
    
    _command = command;
}

- (void)pressButton{
    
    [_command excute];
}

@end
```

遥控器类使用``set``方法注入了具体命令类，并向外提供了``pressButton``这个方法来内部调用已传入的具体命令类的``excute``方法。


最后我们看一下客户端是如何操作这些类的：

```objc
//================== client ==================

//init Light and Command instance
//inject light instance into command instance
Light *light = [[Light alloc] init];
CommandLightOn *co = [[CommandLightOn alloc] initWithLight:light];
    
//set command on instance into remote control instance
RemoteControl *rm = [[RemoteControl alloc] init];
[rm setCommand:co];
    
//excute command（light  on command）
[rm pressButton];
    

//inject light instance into command off instance
CommandLightOff *cf = [[CommandLightOff alloc] initWithLight:light];

//change to off command
[rm setCommand:cf];

//excute command（light  close command）
[rm pressButton];
```

看一下日至输出：

```
[11851:1190777] Light on
[11851:1190777] Light off
```

从上面的代码可以看到，我们首先准备好具体命令类的实例，然后将其传递给遥控器类，最后触发遥控器的``pressButton``方法来间接触发``light``对象的相应操作。


