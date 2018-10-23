
# 工厂方法模式代码示例

首先我们声明一个抽象工厂类 ``PhoneFactory``：

```objc
//================== PhoneFactory.h ==================
#import "Phone.h"

@interface PhoneFactory : NSObject

+ (Phone *)createPhone;

@end


//================== PhoneFactory.m ==================
@implementation PhoneFactory

+ (Phone *)createPhone{
    //implemented by subclass
    return nil;
}

@end
```

> 抽象工厂类给具体工厂提供了生产手机的接口，因此不同的具体工厂可以按照自己的方式来生产手机。下面看一下具体工厂：

苹果手机工厂 ``IPhoneFactory``

```objc
//================== IPhoneFactory.h ==================
@interface IPhoneFactory : PhoneFactory
@end


//================== IPhoneFactory.m ==================
#import "IPhone.h"

@implementation IPhoneFactory

+ (Phone *)createPhone{
    
    IPhone *iphone = [[IPhone alloc] init];
    NSLog(@"iPhone has been created");
    return iphone;
}

@end
```

小米手机工厂 ``MIPhoneFactory``：

```objc
//================== MIPhoneFactory.h ==================
@interface MPhoneFactory : PhoneFactory

@end



//================== MIPhoneFactory.m ==================
#import "MiPhone.h"

@implementation MPhoneFactory

+ (Phone *)createPhone{
    
    MiPhone *miPhone = [[MiPhone alloc] init];
    NSLog(@"MIPhone has been created");
    return miPhone;
}

@end
```

华为手机工厂  ``HWPhoneFactory``:

```objc
//================== HWPhoneFactory.h ==================
@interface HWPhoneFactory : PhoneFactory

@end



//================== HWPhoneFactory.m ==================
#import "HWPhone.h"

@implementation HWPhoneFactory

+ (Phone *)createPhone{
    
    HWPhone *hwPhone = [[HWPhone alloc] init];
    NSLog(@"HWPhone has been created");
    return hwPhone;
}

@end
```

以上就是声明的抽象工厂类和具体工厂类。因为生产手机的责任分配给了各个具体工厂类，因此客户端只需要委托所需手机所对应的工厂就可以获得其生产的手机了。

> 因为抽象产品类``Phone``和三个具体产品类（``IPhone``，``MIPhone``，``HWPhone``）和简单工厂模式中介绍的例子中的一样，因此这里就不再重复介绍了。

下面我们用代码模拟一下该场景：

```objc
//================== Using by client ==================


//A phone store
Store *phoneStore = [[Store alloc] init];
    
//phoneStore wants to sell iphone
Phone *iphone = [IPhoneFactory  createPhone];
[iphone packaging];
[phoneStore sellPhone:iphone];
    
    
//phoneStore wants to sell MIPhone
Phone *miPhone = [MPhoneFactory createPhone];
[miPhone packaging];
[phoneStore sellPhone:miPhone];
    
//phoneStore wants to sell HWPhone
Phone *hwPhone = [HWPhoneFactory createPhone];
[hwPhone packaging];
[phoneStore sellPhone:hwPhone];
```

由上面的代码可以看出：客户端``phoneStore``只需委托iPhone，MIPhone，HWPhone对应的工厂即可获得对应的手机了。

而且以后如果增加其他牌子的手机，例如魅族手机，就可以声明一个魅族手机类和魅族手机的工厂类并实现``createPhone``这个方法即可，而不需要改动原有已经声明好的各个手机类和具体工厂类。
