```objc
//================== FrondEndDeveloper.h ==================

@interface FrondEndDeveloper : NSObject

- (void)writeJavaScriptCode;

@end



//================== FrondEndDeveloper.m ==================

@implementation FrondEndDeveloper

- (void)writeJavaScriptCode{
    NSLog(@"Write JavaScript code");
}

@end
```



```objc
//================== BackEndDeveloper.h ==================

@interface BackEndDeveloper : NSObject

- (void)writeJavaCode;

@end



//================== BackEndDeveloper.m ==================

@implementation BackEndDeveloper

- (void)writeJavaCode{
    NSLog(@"Write Java code");
}
@end
```


```objc
//================== Project.h ==================

@interface Project : NSObject

//构造方法，传入开发者的数组
- (instancetype)initWithDevelopers:(NSArray *)developers;

//开始开发
- (void)startDeveloping;

@end



//================== Project.m ==================

#import "Project.h"
#import "FrondEndDeveloper.h"
#import "BackEndDeveloper.h"

@implementation Project
{
    NSArray *_developers;
}


- (instancetype)initWithDevelopers:(NSArray *)developers{
    
    if (self = [super init]) {
        _developers = developers;
    }
    return self;
}



- (void)startDeveloping{
    
    [_developers enumerateObjectsUsingBlock:^(id  _Nonnull developer, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([developer isKindOfClass:[FrondEndDeveloper class]]) {
            
            [developer writeJavaScriptCode];
            
        }else if ([developer isKindOfClass:[BackEndDeveloper class]]){
            
            [developer writeJavaCode];
            
        }else{
            //no such developer
        }
    }];
}

@end
```
