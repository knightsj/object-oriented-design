
# 简单工厂模式代码示例

抽象产品类``Phone``：

```objc
//================== Phone.h ==================
@interface Phone : NSObject

//package to store
- (void)packaging;

@end
```

具体产品类 ``IPhone``：

```objc
//================== IPhone.h ==================
@interface IPhone : Phone

@end


//================== IPhone.m ==================
@implementation IPhone

- (void)packaging{
    NSLog(@"IPhone has been packaged");
}

@end
```

具体产品类 ``MIPhone``：

```objc
//================== MIPhone.h ==================
@interface MIPhone : Phone

@end



//================== MIPhone.m ==================
@implementation MIPhone

- (void)packaging{
    NSLog(@"MIPhone has been packaged");
}

@end
```

具体产品类：``HWPhone``:

```objc
//================== HWPhone.h ==================
@interface HWPhone : Phone

@end



//================== HWPhone.m ==================
@implementation HWPhone

- (void)packaging{
    NSLog(@"HUAWEI Phone has been packaged");
}

@end
```

以上是抽象产品类以及它的三个子类：苹果手机类，小米手机类和华为手机类。
下面看一下工厂类 ``PhoneFactory``：

```objc
//================== PhoneFactory.h ==================
@interface PhoneFactory : NSObject

+ (Phone *)createPhoneWithTag:(NSString *)tag;

@end


//================== PhoneFactory.m ==================
#import "IPhone.h"
#import "MIPhone.h"
#import "HWPhone.h"

@implementation PhoneFactory

+ (Phone *)createPhoneWithTag:(NSString *)tag{
    
    if ([tag isEqualToString:@"i"]) {
        
        IPhone *iphone = [[IPhone alloc] init];
        return iphone;
        
    }else if ([tag isEqualToString:@"MI"]){
        
        MIPhone *miPhone = [[MIPhone alloc] init];
        return miPhone;
        
    }else if ([tag isEqualToString:@"HW"]){
        
        HWPhone *hwPhone = [[HWPhone alloc] init];
        return hwPhone;
        
    }else{
        
        return nil;
    }
}

@end
```

> 工厂类向外部（客户端）提供了一个创造手机的接口``createPhoneWithTag:``，根据传入参数的不同可以返回不同的具体产品类。因此**客户端只需要知道它所需要的产品所对应的参数即可获得对应的产品了**。

在本例中，我们声明了店铺类 ``Store``为客户端类：

```objc
//================== Store.h ==================
#import "Phone.h"

@interface Store : NSObject

- (void)sellPhone:(Phone *)phone;

@end


//================== Store.m ==================
@implementation Store

- (void)sellPhone:(Phone *)phone{
    NSLog(@"Store begins to sell phone:%@",[phone class]);
}

@end
```

> 客户端类声明了一个售卖手机的接口``sellPhone:``。表示它可以售卖作为参数所传入的手机。

最后我们用代码模拟一下这个实际场景：

```objc
//================== Using by client ==================


//1. A phone store  wants to sell iPhone
Store *phoneStore = [[Store alloc] init];
    
//2. create phone
Phone *iPhone = [PhoneFactory  createPhoneWithTag:@"i"];
    
//3. package phone to store
[iphone packaging];
    
//4. store sells phone after receving it
[phoneStore sellPhone:iphone];
```

上面代码的解读：

1. 最开始实例化一个商店，商店打算卖苹果手机
2. 商店委托工厂给他制作一台iPhone手机，传入对应的字段``i``。
3. 手机生产好以后打包送到商店
4. 商店售卖手机

