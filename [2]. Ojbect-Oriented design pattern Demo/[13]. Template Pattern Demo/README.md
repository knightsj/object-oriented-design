# 模板方法模式代码示例


首先我们创建算法类``HotDrink``：

```objc
//================== HotDrink.h ==================

@interface HotDrink : NSObject

- (void)makingProcess;

- (void)addMainMaterial;

- (void)addIngredients;

@end



//================== HotDrink.m ==================

@implementation HotDrink

- (void)makingProcess{
    
    NSLog(@" ===== Begin to making %@ ===== ", NSStringFromClass([self class]));
    
    [self boilWater];
    [self addMainMaterial];
    [self addIngredients];
}


- (void)prepareHotWater{
    
    NSLog(@"prepare hot water");
}


- (void)addMainMaterial{
    
    NSLog(@"implemetation by subClasses");
}


- (void)addIngredients{
    
    NSLog(@"implemetation by subClasses");
}


@end
```


``HotDrink``向外部暴露了一个制作过程的接口``makingProcess``，这个接口内部调用了热饮的所有制作步骤方法：

```objc
- (void)makingProcess{
         
     //准备热水     
    [self prepareHotWater];
    
    //添加主成分
    [self addMainMaterial];
    
    //添加辅助成分
    [self addIngredients];
}
```


``HotDrink``只向外暴露了**这三个步骤中的两个**需要子类按照自己方式实现的接口：

```objc
//添加主成分
- (void)addMainMaterial;

//添加辅助成分
- (void)addIngredients;
```

因为热饮的第一步都是一致的（准备热水），所以第一步骤的接口没有暴露出来给子类实现，而是直接在当前类实现了，这也就是模板方法的一个可以复用代码的优点。

OK，我们现在创建好了算法类，那么根据上面的需求，我们接着创建三个具体算法类：

- ``HotDrinkTea`` ： 热茶
- ``HotDrinkLatte`` ： 热拿铁
- ``HotDrinkAmericano ``： 热美式



```objc
//================== HotDrinkTea.h ==================

@interface HotDrinkTea : HotDrink

@end



//================== HotDrinkTea.m ==================

@implementation HotDrinkTea


- (void)addMainMaterial{
    
    NSLog(@"add tea leaf");
}


- (void)addIngredients{
    
    NSLog(@"add nothing");
}


@end
```

热茶在``addMainMaterial``步骤里面是添加了茶叶，而在``addIngredients``步骤没有做任何事情（这里先假定是纯的茶叶）。

类似地，我们看一下两种热咖啡的实现。首先是热拿铁``HotDrinkLatte``:

```objc
//================== HotDrinkLatte.h ==================

@interface HotDrinkLatte : HotDrink

@end



//================== HotDrinkLatte.m ==================

@implementation HotDrinkLatte

- (void)addMainMaterial{
    
    NSLog(@"add ground coffee");
}


- (void)addIngredients{
    
    NSLog(@"add milk");
}


@end
```

热拿铁在``addMainMaterial``步骤里面是添加了咖啡粉，而在``addIngredients``步骤添加了牛奶。

下面再看一下热美式``HotDrinkAmericano``：

```objc
//================== HotDrinkAmericano.h ==================

@interface HotDrinkAmericano : HotDrink

@end



//================== HotDrinkAmericano.m ==================

@implementation HotDrinkAmericano

- (void)addMainMaterial{
    
    NSLog(@"add ground coffee");
}


- (void)addIngredients{
    
    NSLog(@"add nothing");
}

@end
```

热美式在``addMainMaterial``步骤里面是添加了咖啡粉，而在``addIngredients``步骤没有做任何事，因为美式就是纯的咖啡，理论上除了水和咖啡不需要添加任何其他东西。


到现在三种热饮类创建好了，我们现在分别制作这三种热饮，并看一下日至输出：


```
===== Begin to making HotDrinkTea =====
prepare hot water
add tea leaf
add nothing
===== Begin to making HotDrinkLatte =====
prepare hot water
add ground coffee
add milk
===== Begin to making HotDrinkAmericano =====
prepare hot water
add ground coffee
add nothing
```

上面的日至输出准确无误地反映了我们所定义的这三种热饮制作过程：

- 热茶：准备热水 + 茶叶
- 热拿铁：准备热水 + 咖啡 + 牛奶
- 热美式：准备热水 + 咖啡
