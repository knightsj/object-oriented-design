```objc

//================== Car.h ==================

@class GasEngine;

@interface Car : NSObject

//构造方法
- (instancetype)initWithEngine:(GasEngine *)engine;

//返回私有成员变量：引擎的实例
- (GasEngine *)usingEngine;

@end




//================== Car.m ==================

#import "Car.h"
#import "GasEngine.h"

@implementation Car
{
    GasEngine *_engine;
}

- (instancetype)initWithEngine:(GasEngine *)engine{
    
    self = [super init];
    
    if (self) {
        _engine = engine;
    }
    return self;
}

- (GasEngine *)usingEngine{
    
    return _engine;
}

@end
```


```objc
//================== GasEngine.h ==================
@interface GasEngine : NSObject

@property (nonatomic, copy) NSString *brandName;

@end

```



```objc
//================== Client.m ==================

#import "GasEngine.h"
#import "Car.h"

- (NSString *)findCarEngineBrandName:(Car *)car{

    GasEngine *engine = [car usingEngine];
    NSString *engineBrandName = engine.brandName;//获取到了引擎的品牌名称
    return engineBrandName;
}
```
