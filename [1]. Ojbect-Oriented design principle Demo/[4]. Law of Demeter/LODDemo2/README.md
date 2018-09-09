
```objc
//================== Car.h ==================

@class GasEngine;

@interface Car : NSObject

//构造方法
- (instancetype)initWithEngine:(GasEngine *)engine;

//直接返回引擎品牌名称
- (NSString *)usingEngineBrandName;

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


- (NSString *)usingEngineBrandName{
    return _engine.brand;
}

@end
```

```objc
//================== Client.m ==================

#import "Car.h"

- (NSString *)findCarEngineBrandName:(Car *)car{
    
    NSString *engineBrandName = [car usingEngineBrandName]; //直接获取到了引擎的品牌名称
    return engineBrandName;
}
```
