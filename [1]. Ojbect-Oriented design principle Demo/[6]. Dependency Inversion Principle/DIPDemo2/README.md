```objc
//================== DeveloperProtocol.h ==================

@protocol DeveloperProtocol <NSObject>

- (void)writeCode;

@end
```



```objc
//================== FrondEndDeveloper.h ==================

@interface FrondEndDeveloper : NSObject<DeveloperProtocol>
@end



//================== FrondEndDeveloper.m ==================

@implementation FrondEndDeveloper

- (void)writeCode{
    NSLog(@"Write JavaScript code");
}
@end
```


```objc
//================== BackEndDeveloper.h ==================

@interface BackEndDeveloper : NSObject<DeveloperProtocol>
@end



//================== BackEndDeveloper.m ==================
@implementation BackEndDeveloper

- (void)writeCode{
    NSLog(@"Write Java code");
}
@end
```



```objc
//================== Project.h ==================

#import "DeveloperProtocol.h"

@interface Project : NSObject

//只需传入遵循DeveloperProtocol的对象数组即可
- (instancetype)initWithDevelopers:(NSArray <id <DeveloperProtocol>>*)developers;

//开始开发
- (void)startDeveloping;

@end


//================== Project.m ==================

#import "FrondEndDeveloper.h"
#import "BackEndDeveloper.h"

@implementation Project
{
    NSArray <id <DeveloperProtocol>>* _developers;
}


- (instancetype)initWithDevelopers:(NSArray <id <DeveloperProtocol>>*)developers{
    
    if (self = [super init]) {
        _developers = developers;
    }
    return self;
    
}


- (void)startDeveloping{
    
    //每次循环，直接向对象发送writeCode方法即可，不需要判断
    [_developers enumerateObjectsUsingBlock:^(id<DeveloperProtocol>  _Nonnull developer, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [developer writeCode];
    }];
    
}

@end
```
