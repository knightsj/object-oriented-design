# 生成器模式代码示例

首先我们定义手机这个类，它有几个属性：

```objc
//================== Phone.h ==================
@interface Phone : NSObject

@property (nonatomic, copy) NSString *cpu;
@property (nonatomic, copy) NSString *capacity;
@property (nonatomic, copy) NSString *display;
@property (nonatomic, copy) NSString *camera;

@end
```

然后我们创建抽象builder类：

```objc
//================== Builder.h ==================
#import "Phone.h"

@interface Builder : NSObject
{
    @protected Phone *_phone;
}

- (void)createPhone;

- (void)buildCPU;
- (void)buildCapacity;
- (void)buildDisplay;
- (void)buildCamera;


- (Phone *)obtainPhone;

@end
```

> 抽象builder类声明了创建手机各个组件的接口，也提供了返回手机实例的对象。

接下来我们创建对应不同手机的具体生成者类：

IPhoneXR手机的builder：``IPhoneXRBuilder``：

```objc
//================== IPhoneXRBuilder.h ==================
@interface IPhoneXRBuilder : Builder

@end



//================== IPhoneXRBuilder.m ==================
@implementation IPhoneXRBuilder


- (void)createPhone{
    
    _phone = [[Phone alloc] init];
}


- (void)buildCPU{
    
    [_phone setCpu:@"A12"];
}

- (void)buildCapacity{

    [_phone setCapacity:@"256"];
}


- (void)buildDisplay{
    
    [_phone setDisplay:@"6.1"];
}

- (void)buildCamera{
    
    [_phone setCamera:@"12MP"];
}

- (Phone *)obtainPhone{
    return _phone;
}

@end
```

小米8手机的builder：``MI8Builder``：

```objc
//================== MI8Builder.h ==================
@interface MI8Builder : Builder

@end



//================== MI8Builder.m ==================
@implementation MI8Builder

- (void)createPhone{
    
    _phone = [[Phone alloc] init];
}


- (void)buildCPU{
    
    [_phone setCpu:@"Snapdragon 845"];
}

- (void)buildCapacity{
    
    [_phone setCapacity:@"128"];
}


- (void)buildDisplay{
    
    [_phone setDisplay:@"6.21"];
}

- (void)buildCamera{
    
    [_phone setCamera:@"12MP"];
}

- (Phone *)obtainPhone{
    return _phone;
}

@end
```

> 从上面两个具体builder的代码可以看出，这两个builder都按照其对应的手机配置来创建其对应的手机。

下面来看一下Director的用法：

```objc
//================== Director.h ==================
#import "Builder.h"

@interface Director : NSObject

- (void)constructPhoneWithBuilder:(Builder *)builder;

- (Phone *)obtainPhone;

@end


//================== Director.m ==================
implementation Director
{
    Builder *_builder;
}


- (void)constructPhoneWithBuilder:(Builder *)builder{
    
    _builder = builder;
    
    [_builder buildCPU];
    [_builder buildCapacity];
    [_builder buildDisplay];
    [_builder buildCamera];
    
}


- (Phone *)obtainPhone{
    
    return [_builder obtainPhone];
}


@end

```

> Director类提供了``construct:``方法，需要传入builder的实例。该方法里面按照既定的顺序来创建手机。

最后我们看一下客户端是如何使用具体的Builder和Director实例的：



```objc
//================== Using by client ==================


//Get iPhoneXR
//1. A director instance
Director *director = [[Director alloc] init];
    
//2. A builder instance
IPhoneXRBuilder *iphoneXRBuilder = [[IPhoneXRBuilder alloc] init];
    
//3. Construct phone by director
[director construct:iphoneXRBuilder];
    
//4. Get phone by builder
Phone *iPhoneXR = [iphoneXRBuilder obtainPhone];
NSLog(@"Get new phone iPhoneXR of data: %@",iPhoneXR);
    
    
//Get MI8
MI8Builder *mi8Builder = [[MI8Builder alloc] init];
[director construct:mi8Builder];
Phone *mi8 = [mi8Builder obtainPhone];
NSLog(@"Get new phone MI8      of data: %@",mi8);
```

> 从上面可以看出客户端获取具体产品的过程：
>
> 1. 首先需要实例化一个Director的实例。
> 2. 然后根据所需要的产品找出其对应的builder。
> 3. 将builder传入director实例的``construct:``方法。
> 4. 从builder的``obtainPhone``获取手机实例。