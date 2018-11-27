# 适配器模式代码示例



### 场景概述

模拟一个替换缓存组件的场景：目前客户端已经依赖于旧的缓存组件的接口，而后来发现有一个新的缓组件的性能更好一些，需要将旧的缓存组件替换成新的缓存组件，但是新的缓存组件的接口与旧的缓存接口不一致，所以目前来看客户端是无法直接与新缓存组件一起工作的。



### 场景分析

由于客户端在很多地方依赖了旧缓存组件的接口，将这些地方的接口都换成新缓存组件的接口会比较麻烦，而且万一后面还要换回旧缓存组件或者再换成另外一个新的缓存组件的话就还要做重复的事情，这显然是不够优雅的。

因此该场景比较适合使用适配器模式：创建一个适配器，让原本与旧缓存接口的客户端可以与新缓存组件一起工作。



在这里，新的缓存组件就是``Adaptee``，旧的缓存组件（接口）就是``Target``，因为它是直接和客户端接触的。而我们需要创建一个适配器类``Adaptor``来让客户端与新缓存组件一起工作。下面用代码看一下上面的问题如何解决：



### 代码实现

首先我们创建旧缓存组件，并让客户端正常使用它。
先创建旧缓存组件的接口``OldCacheProtocol``：

> 对应Java的接口，Objective-C中叫做协议，也就是protocol。

```objc
//================== OldCacheProtocol.h ==================

@protocol OldCacheProtocol <NSObject>

- (void)old_saveCacheObject:(id)obj forKey:(NSString *)key;

- (id)old_getCacheObjectForKey:(NSString *)key;

@end
```

> 可以看到该接口包含了两个操作缓存的方法，方法前缀为``old``。

再简单创建一个缓存组件类``OldCache``，它实现了``OldCacheProtocol``接口：

```objc
//================== OldCache.h ==================

@interface OldCache : NSObject <OldCacheProtocol>

@end


    
//================== OldCache.m ==================
    
@implementation OldCache

- (void)old_saveCacheObject:(id)obj forKey:(NSString *)key{
    
    NSLog(@"saved cache by old cache object");
    
}

- (id)old_getCacheObjectForKey:(NSString *)key{
    
    NSString *obj = @"get cache by old cache object";
    NSLog(@"%@",obj);
    return obj;
}

@end
```

> 为了读者区分方便，将新旧两个缓存组件取名为``NewCache``和``OldCache``。实现代码也比较简单，因为不是本文介绍的重点，只需区分接口名称即可。

现在我们让客户端来使用这个旧缓存组件：

```objc
//================== client.m ==================

@interface ViewController ()

@property (nonatomic, strong) id<OldCacheProtocol>cache;

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    //使用旧缓存
    [self useOldCache];

    //使用缓存组件操作
    [self saveObject:@"cache" forKey:@"key"];
    
}

//实例化旧缓存并保存在``cache``属性里
- (void)useOldCache{

    self.cache = [[OldCache alloc] init];
}

//使用cache对象
- (void)saveObject:(id)object forKey:(NSString *)key{

    [self.cache old_saveCacheObject:object forKey:key];
}
```

> - 在这里的客户端就是``ViewController``，它持有一个遵从``OldCacheProtocol``协议的实例，也就是说它目前依赖于``OldCacheProtocol``的接口。
> - ``useOldCache``方法用来实例化旧缓存并保存在``cache``属性里。
> - ``saveObject:forKey:``方法是真正使用cache对象来保存缓存。

运行并打印一下结果输出是：``saved cache by old cache object``。现在看来客户端使用旧缓存是没有问题的。

而现在我们要加入新的缓存组件了：
首先定义新缓存组件的接口``NewCacheProtocol``：

```objc
//================== NewCacheProtocol.h ==================

@protocol NewCacheProtocol <NSObject>

- (void)new_saveCacheObject:(id)obj forKey:(NSString *)key;

- (id)new_getCacheObjectForKey:(NSString *)key;

@end
```

可以看到，``NewCacheProtocol``与``OldCacheProtocol``接口大致是相似的，但是名称还是不同，这里使用了不同的方法前缀做了区分。

接着看一下新缓存组件是如何实现这个接口的：

```objc
//================== NewCache.h ==================

@interface NewCache : NSObject <NewCacheProtocol>

@end


    
//================== NewCache.m ==================
@implementation NewCache

- (void)new_saveCacheObject:(id)obj forKey:(NSString *)key{
    
    NSLog(@"saved cache by new cache object");
}

- (id)new_getCacheObjectForKey:(NSString *)key{
    
    NSString *obj = @"saved cache by new cache object";
    NSLog(@"%@",obj);
    return obj;
}
@end
```

现在我们拿到了新的缓存组件，但是客户端类目前依赖的是旧的接口，因此适配器类应该上场了：

```objc
//================== Adaptor.h ==================

@interface Adaptor : NSObject <OldCacheProtocol>

- (instancetype)initWithNewCache:(NewCache *)newCache;

@end


    
//================== Adaptor.m ==================
    
@implementation Adaptor
{
    NewCache *_newCache;
}

- (instancetype)initWithNewCache:(NewCache *)newCache{
    
    self = [super init];
    if (self) {
        _newCache = newCache;
    }
    return self;
}

- (void)old_saveCacheObject:(id)obj forKey:(NSString *)key{
    
    //transfer responsibility to new cache object
    [_newCache new_saveCacheObject:obj forKey:key];
}

- (id)old_getCacheObjectForKey:(NSString *)key{
    
    //transfer responsibility to new cache object
    return [_newCache new_getCacheObjectForKey:key];
    
}
@end
```

> - 首先，适配器类也实现了旧缓存组件的接口；目的是让它也可以接收到客户端操作旧缓存组件的方法。
> - 然后，适配器的构造方法里面需要传入新组件类的实例；目的是在收到客户端操作旧缓存组件的命令后，将该命令转发给新缓存组件类，并调用其对应的方法。
> - 最后我们看一下适配器类是如何实现两个旧缓存组件的接口的：在``old_saveCacheObject:forKey:``方法中，让新缓存组件对象调用对应的``new_saveCacheObject:forKey:``方法；同样地，在``old_getCacheObjectForKey``方法中，让新缓存组件对象调用对应的``new_getCacheObjectForKey:``方法。

这样一来，适配器类就定义好了。
那么最后我们看一下在客户端里面是如何使用适配器的：

```objc
//================== client ==================

- (void)viewDidLoad {

    [super viewDidLoad];
 
    //使用新缓存组件
    [self useNewCache];
    
    [self saveObject:@"cache" forKey:@"key"];
}

- (void)useOldCache{
    
    self.cache = [[OldCache alloc] init];
}

//使用新缓存组件
- (void)useNewCache{
    
    self.cache = [[Adaptor alloc] initWithNewCache:[[NewCache alloc] init]];
}

//使用cache对象
- (void)saveObject:(id)object forKey:(NSString *)key{
    
    [self.cache old_saveCacheObject:object forKey:key];
}
```

> 我们可以看到，在客户端里面，只需要改一处就可以了：将我们定义好的适配器类保存在原来的``cache``属性中就可以了（``useNewCache``方法的实现）。而真正操作缓存的方法``saveObject:forKey``不需要有任何改动。

我们可以看到，使用适配器模式，客户端调用旧缓存组件接口的方法都不需要改变；只需稍作处理，就可以在新旧缓存组件中来回切换，也不需要原来客户端对缓存的操作。



而之所以可以做到这么灵活，其实也是因为在一开始客户端只是依赖了旧缓存组件类所实现的接口，而不是旧缓存组件类的类型。有心的读者可能注意到了，上面``viewController``的属性是``@property (nonatomic, strong) id<OldCacheProtocol>cache;``。正因为如此，我们新建的适配器实例才能直接用在这里，因为适配器类也是实现了``<OldCacheProtocol>``接口。相反，如果我们的``cache``属性是这么写的：``@property (nonatomic, strong) OldCache *cache;``，即客户端依赖了旧缓存组件的类型，那么我们的适配器类就无法这么容易地放在这里了。因此为了我们的程序在将来可以更好地修改和扩展，依赖接口是一个前提。