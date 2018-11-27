# 单例模式代码示例

创建单例类 ``LogManager``

```objc
//================== LogManager.h ==================
@interface LogManager : NSObject

+(instancetype)sharedInstance;

- (void)printLog:(NSString *)logMessage;

- (void)uploadLog:(NSString *)logMessage;

@end



//================== LogManager.m ==================
@implementation LogManager

static LogManager* _sharedInstance = nil;

+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _sharedInstance ;
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    return [LogManager sharedInstance] ;
}

-(id)copyWithZone:(struct _NSZone *)zone
{
    return [LogManager sharedInstance];
}

-(id)mutableCopyWithZone:(NSZone *)zone
{
    return [LogManager sharedInstance];
}

- (void)printLog:(NSString *)logMessage{
    //print logMessage
}

- (void)uploadLog:(NSString *)logMessage{
    //upload logMessage
}

@end
```

从上面的代码中可以看到：

- ``sharedInstance``方法是向外部提供的获取唯一的实例对象的方法，也是该类中的其他可以创建对象的方法的都调用的方法。在这个方法内部使用了``dispatch_once``函数来避免多线程访问导致创建多个实例的情况。
- 为了在``alloc init``出初始化方法可以返回同一个实例对象，在``allocWithZone:``方法里面仍然调用了``sharedInstance``方法。
- 而且为了在``copy``和``mutableCopy``方法也可以返回同一个实例对象，在``copyWithZone:``与``mutableCopyWithZone``也是调用了``sharedInstance``方法。

下面分别用这些接口来验证一下实例的唯一性：

```objc
//================== Using by client ==================

//alloc&init
LogManager *manager0 = [[LogManager alloc] init];

//sharedInstance
LogManager *manager1 = [LogManager sharedInstance];

//copy
LogManager *manager2 = [manager0 copy];
    
//mutableCopy
LogManager *manager3 = [manager1 mutableCopy];
    
NSLog(@"\nalloc&init:     %p\nsharedInstance: %p\ncopy:           %p\nmutableCopy:    %p",manager0,manager1,manager2,manager3);
```

我们看一下打印出来的四个指针所指向对象的地址：

```
alloc&init:     0x60000000f7e0
sharedInstance: 0x60000000f7e0
copy:           0x60000000f7e0
mutableCopy:    0x60000000f7e0
```

可以看出打印出来的地址都相同，说明都是同一对象，证明了实现方法的正确性。