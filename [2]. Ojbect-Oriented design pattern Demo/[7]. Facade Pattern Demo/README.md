# 外观模式代码示例



### 场景概述



模拟一个智能家居系统。这个智能家居系统可以用一个中央遥控器操作其所接入的一些家具：台灯，音箱，空调等等。



在这里我们简单操纵几个设备：

- 空调
- CD Player
- DVD Player
- 音箱
- 投影仪





### 场景分析



有的时候，我们需要某个设备可以一次执行两个不同的操作；也可能会需要多个设备共同协作来执行一些任务。比如：



假设我们可以用遥控器直接开启热风，那么实际上就是两个步骤：

1. 开启空调
2. 空调切换为热风模式

我们把这两个步骤用一个操作包含起来，一步到位。像这样简化操作步骤的场景比较适合用外观模式。



同样的，我们想听歌的话，需要四个步骤：

1. 开启CD Player
2. 开启音箱
3. 连接CD Player和音箱
4. 播放CD Player

这些步骤我们也可以装在单独的一个接口里面。



类似的，如果我们想看DVD的话，步骤会更多，因为DVD需要同时输出声音和影像：

1. 开启DVD player
2. 开启音箱
3. 音响与DVD Player连接
4. 开启投影仪
5. 投影仪与DVD Player连接
6. 播放DVD Player

这些接口也可以装在一个单独的接口里。



最后，如果我们要出门，需要关掉所有家用电器，也不需要一个一个将他们关掉，也只需要一个关掉的总接口就好了，因为这个关掉的总接口里面可以包含所有家用电器的关闭接口。



因此，这些设备可以看做是该智能家居系统的子系统；而这个遥控器则扮演的是外观类的角色。



下面我们用代码来看一下如何实现这些设计。



### 代码实现

因为所有家用电器都有开启和关闭的操作，所以我们先创建一个家用电器的基类``HomeDevice``：

```objc
//================== HomeDevice.h ==================
//设备基类

@interface HomeDevice : NSObject

//连接电源
- (void)on;

//关闭电源
- (void)off;

@end
```

然后是继承它的所有家用电器类：

空调类``AirConditioner``:

```objc
//================== AirConditioner.h ==================

@interface AirConditioner : HomeDevice

//高温模式
- (void)startHighTemperatureMode;

//常温模式
- (void)startMiddleTemperatureMode;

//低温模式
- (void)startLowTemperatureMode;

@end
```

CD Player类：``CDPlayer``:

```objc
//================== CDPlayer.h ==================

@interface CDPlayer : HomeDevice

- (void)play;

@end
```

DVD Player类：``DVDPlayer``:

```objc
//================== DVDPlayer.h ==================

@interface DVDPlayer : HomeDevice

- (void)play;

@end
```

音箱类``VoiceBox``:

```objc
//================== VoiceBox.h ==================

@class CDPlayer;
@class DVDPlayer;

@interface VoiceBox : HomeDevice

//与CDPlayer连接
- (void)connetCDPlayer:(CDPlayer *)cdPlayer;

//与CDPlayer断开连接
- (void)disconnetCDPlayer:(CDPlayer *)cdPlayer;

//与DVD Player连接
- (void)connetDVDPlayer:(DVDPlayer *)dvdPlayer;

//与DVD Player断开连接
- (void)disconnetDVDPlayer:(DVDPlayer *)dvdPlayer;

@end
```

投影仪类``Projecter``：

```objc
//================== Projecter.h ==================

@interface Projecter : HomeDevice

//与DVD Player连接
- (void)connetDVDPlayer:(DVDPlayer *)dvdPlayer;

//与DVD Player断开连接
- (void)disconnetDVDPlayer:(DVDPlayer *)dvdPlayer;

@end
```

> 注意，音箱是可以连接CD Player和DVD Player的；而投影仪只能连接DVD Player

现在我们把所有的家用电器类和他们的接口都定义好了，下面我们看一下该实例的外观类``HomeDeviceManager``如何设计。

首先我们看一下客户端期望外观类实现的接口：

```objc
//================== HomeDeviceManager.h ==================

@interface HomeDeviceManager : NSObject

//===== 关于空调的接口 =====

//空调吹冷风
- (void)coolWind;

//空调吹热风
- (void)warmWind;


//===== 关于CD Player的接口 =====

//播放CD
- (void)playMusic;

//关掉音乐
- (void)offMusic;


//===== 关于DVD Player的接口 =====

//播放DVD
- (void)playMovie;

//关闭DVD
- (void)offMoive;


//===== 关于总开关的接口 =====

//打开全部家用电器
- (void)allDeviceOn;

//关闭所有家用电器
- (void)allDeviceOff;

@end
```

上面的接口分为了四大类，分别是：

- 关于空调的接口
- 关于CD Player的接口
- 关于DVD Player的接口
- 关于总开关的接口

> 为了便于读者理解，这四类的接口所封装的子系统接口的数量是逐渐增多的。

在看这些接口时如何实现的之前，我们先看一下外观类是如何保留这些子系统类的实例的。在该代码示例中，这些子系统类的实例在外观类的构造方法里被创建，而且作为外观类的成员变量被保存了下来。

```objc
//================== HomeDeviceManager.m ==================

@implementation HomeDeviceManager
{
    NSMutableArray *_registeredDevices;//所有注册(被管理的)的家用电器
    AirConditioner *_airconditioner;
    CDPlayer *_cdPlayer;
    DVDPlayer *_dvdPlayer;
    VoiceBox *_voiceBox;
    Projecter *_projecter;
    
}

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        _airconditioner = [[AirConditioner alloc] init];
        _cdPlayer = [[CDPlayer alloc] init];
        _dvdPlayer = [[DVDPlayer alloc] init];
        _voiceBox = [[VoiceBox alloc] init];
        _projecter = [[Projecter alloc] init];
        
        _registeredDevices = [NSMutableArray arrayWithArray:@[_airconditioner,
                                                              _cdPlayer,
                                                              _dvdPlayer,
                                                              _voiceBox,
                                                              _projecter]];
    }
    return self;
}
```

其中 ``_registeredDevices``这个成员变量是一个数组，它包含了所有和这个外观类实例关联的子系统实例。

子系统与外观类的关联实现方式不止一种，不作为本文研究重点，现在只需知道外观类保留了这些子系统的实例即可。按照顺序，我们首先看一下关于空调的接口的实现：

```objc
//================== HomeDeviceManager.m ==================

//空调吹冷风
- (void)coolWind{
    
    [_airconditioner on];
    [_airconditioner startLowTemperatureMode];
    
}

//空调吹热风
- (void)warmWind{
    
    [_airconditioner on];
    [_airconditioner startHighTemperatureMode];
}
```

吹冷风和吹热风的接口都包含了空调实例的两个接口，第一个都是开启空调，第二个则是对应的冷风和热风的接口。

我们接着看关于CD Player的接口的实现：

```objc
//================== HomeDeviceManager.m ==================

- (void)playMusic{
    
    //1. 开启CDPlayer开关
    [_cdPlayer on];
    
    //2. 开启音箱
    [_voiceBox on];
    
    //3. 音响与CDPlayer连接
    [_voiceBox connetCDPlayer:_cdPlayer];
    
    //4. 播放CDPlayer
    [_cdPlayer play];
}

//关掉音乐
- (void)offMusic{
    
   //1. 切掉与音箱的连接
    [_voiceBox disconnetCDPlayer:_cdPlayer];
    
    //2. 关掉音箱
    [_voiceBox off];
    
    //3. 关掉CDPlayer
    [_cdPlayer off];
}
```

在上面的场景分析中提到过，听音乐这个指令要分四个步骤：CD Player和音箱的开启，二者的连接，以及播放CD Player，这也比较符合实际生活中的场景。关掉音乐也是先断开连接再切断电源（虽然直接切断电源也可以）。

接下来我们看一下关于DVD Player的接口的实现：

```objc
//================== HomeDeviceManager.m ==================

- (void)playMovie{
    
    //1. 开启DVD player
    [_dvdPlayer on];
    
    //2. 开启音箱
    [_voiceBox on];
    
    //3. 音响与DVDPlayer连接
    [_voiceBox connetDVDPlayer:_dvdPlayer];
    
    //4. 开启投影仪
    [_projecter on];
    
    //5.投影仪与DVDPlayer连接
    [_projecter connetDVDPlayer:_dvdPlayer];
    
    //6. 播放DVDPlayer
    [_dvdPlayer play];
}


- (void)offMoive{

    //1. 切掉音箱与DVDPlayer连接
    [_voiceBox disconnetDVDPlayer:_dvdPlayer];
    
    //2. 关掉音箱
    [_voiceBox off];
    
    //3. 切掉投影仪与DVDPlayer连接
    [_projecter disconnetDVDPlayer:_dvdPlayer];
    
    //4. 关掉投影仪
    [_projecter off];
    
    //5. 关掉DVDPlayer
    [_dvdPlayer off];
}
```

因为DVD Player要同时连接音箱和投影仪，所以这两个接口封装的子系统接口相对于CD Player的更多一些。

最后我们看一下关于总开关的接口的实现：

```objc
//================== HomeDeviceManager.m ==================

//打开全部家用电器
- (void)allDeviceOn{
    
    [_registeredDevices enumerateObjectsUsingBlock:^(HomeDevice *device, NSUInteger idx, BOOL * _Nonnull stop) {
        [device on];
    }];
}


//关闭所有家用电器
- (void)allDeviceOff{
    
    [_registeredDevices enumerateObjectsUsingBlock:^(HomeDevice *device, NSUInteger idx, BOOL * _Nonnull stop) {
        [device off];
    }];
}
```

这两个接口是为了方便客户端开启和关闭所有设备的，有这两个接口的话，用户就不用一一开启或关闭多个设备了。

关于这两个接口的实现：

上文说过，该外观类通过一个数组成员变量``_registeredDevices``来保存所有可操作的设备。所以如果我们需要开启或关闭所有的设备就可以遍历这个数组并向每个元素调用``on``或``off``方法。因为这些元素都继承于``HomeDevice``，也就是都有``on``或``off``方法。

这样做的好处是，我们不需要单独列出所有设备来分别调用它们的接口；而且后面如果添加或者删除某些设备的话也不需要修改这两个接口的实现了。