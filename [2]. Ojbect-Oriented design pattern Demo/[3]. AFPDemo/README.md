
# 抽象工厂方法模式代码示例

首先引入电脑的基类和各个品牌的电脑类：

电脑基类：

```objc
//================== Computer.h ==================
@interface Computer : NSObject

//package to store
- (void)packaging;

@end



//================== Computer.m ==================
@implementation Computer

- (void)packaging{
    //implemented by subclass
}

@end
```

苹果电脑类  ``MacBookComputer``：

```objc
//================== MacBookComputer.h ==================
@interface MacBookComputer : Computer

@end



//================== MacBookComputer.m ==================
@implementation MacBookComputer

- (void)packaging{
     NSLog(@"MacBookComputer has been packaged");
}

@end
```

小米电脑类 ``MIComputer``：

```objc
//================== MIComputer.h ==================
@interface MIComputer : Computer

@end



//================== MIComputer.m ==================
@implementation MIComputer

- (void)packaging{
    NSLog(@"MIComputer has been packaged");
}

@end
```

华为电脑类 ``MateBookComputer``：

```objc
//================== MateBookComputer.h ==================
@interface MateBookComputer : Computer

@end



//================== MateBookComputer.m ==================
@implementation MateBookComputer

- (void)packaging{
    NSLog(@"MateBookComputer has been packaged");
}

@end
```

引入电脑相关产品类以后，我们需要重新设计工厂类。因为抽象工厂方法模式的工厂是面向产品族的，所以抽象工厂方法模式里的工厂所创建的是同一产品族的产品。下面我们看一下抽象工厂方法模式的工厂该如何设计：

首先创建所有工厂都需要集成的抽象工厂，它声明了生产同一产品族的所有产品的接口：

```objc
//================== Factory.h ==================
#import "Phone.h"
#import "Computer.h"

@interface Factory : NSObject

+ (Phone *)createPhone;

+ (Computer *)createComputer;

@end



//================== Factory.m ==================
@implementation Factory

+ (Phone *)createPhone{
    
    //implemented by subclass
    return nil;
}

+ (Computer *)createComputer{
    
    //implemented by subclass
    return nil;
}

@end
```

接着，根据不同的产品族，我们创建不同的具体工厂：

首先是苹果产品族工厂 ``AppleFactory``：

```objc
//================== AppleFactory.h ==================
@interface AppleFactory : Factory

@end



//================== AppleFactory.m ==================
#import "IPhone.h"
#import "MacBookComputer.h"

@implementation AppleFactory

+ (Phone *)createPhone{
    
    IPhone *iPhone = [[IPhone alloc] init];
    NSLog(@"iPhone has been created");
    return iPhone;
}

+ (Computer *)createComputer{
    
    MacBookComputer *macbook = [[MacBookComputer alloc] init];
    NSLog(@"Macbook has been created");
    return macbook;
}

@end
```

接着是小米产品族工厂 ``MIFactory``：

```objc
//================== MIFactory.h ==================
@interface MIFactory : Factory

@end



//================== MIFactory.m ==================
#import "MIPhone.h"
#import "MIComputer.h"

@implementation MIFactory

+ (Phone *)createPhone{
    
    MIPhone *miPhone = [[MIPhone alloc] init];
    NSLog(@"MIPhone has been created");
    return miPhone;
}

+ (Computer *)createComputer{
    
    MIComputer *miComputer = [[MIComputer alloc] init];
    NSLog(@"MIComputer has been created");
    return miComputer;
}

@end
```

最后是华为产品族工厂 ``HWFactory``：

```objc
//================== HWFactory.h ==================
@interface HWFactory : Factory

@end



//================== HWFactory.m ==================
#import "HWPhone.h"
#import "MateBookComputer.h"

@implementation HWFactory

+ (Phone *)createPhone{
    
    HWPhone *hwPhone = [[HWPhone alloc] init];
    NSLog(@"HWPhone has been created");
    return hwPhone;
}

+ (Computer *)createComputer{
    
    MateBookComputer *hwComputer = [[MateBookComputer alloc] init];
    NSLog(@"HWComputer has been created");
    return hwComputer;
}

@end
```

以上就是工厂类的设计。这样设计好之后，客户端如果需要哪一产品族的某个产品的话，只需要找到对应产品族工厂后，调用生产该产品的接口即可。假如需要苹果电脑，只需要委托苹果工厂来制造苹果电脑即可；如果需要小米手机，只需要委托小米工厂制造小米手机即可。



下面用代码来模拟一下这个场景：

```objc
//================== Using by client ==================


Store *store = [[Store alloc] init];
    
//Store wants to sell MacBook
Computer *macBook = [AppleFactory createComputer];
[macBook packaging];
    
[store sellComputer:macBook];
    
    
//Store wants to sell MIPhone
Phone *miPhone = [MIFactory createPhone];
[miPhone packaging];
    
[store sellPhone:miPhone];
    
    
//Store wants to sell MateBook
Computer *mateBook = [HWFactory createComputer];
[mateBook packaging];
    
[store sellComputer:mateBook];
```

上面的代码就是模拟了商店售卖苹果电脑，小米手机，华为电脑的场景。而今后如果该商店引入了新品牌的产品，比如联想手机，联想电脑，那么我们只需要新增联想手机类，联想电脑类，联想工厂类即可。
