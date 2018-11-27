# 享元模式代码示例



### 场景概述

这里我们使用[《Objective-C 编程之道：iOS设计模式解析》](https://book.douban.com/subject/6920082/)里的第21章使用的例子：在一个页面展示数百个大小，位置不同的花的图片，然而这些花的样式只有6种。

看一下截图：
![百花图](http://jknight-blog.oss-cn-shanghai.aliyuncs.com/design-pattern-structure/fwp_demo_pic1.png)

### 场景分析

由于这里我们需要创建很多对象，而这些对象有可以共享的内部状态（6种图片内容）以及不同的外部状态（随机的，数百个位置坐标和图片大小），因此比较适合使用享元模式来做。

根据上面提到的享元模式的成员：

- 我们需要创建一个工厂类来根据花的类型来返回花对象（这个对象包括内部可以共享的图片以及外部状态位置和大小）：每次当新生成一种花的类型的对象的时候就把它保存起来，因为下次如果还需要这个类型的花内部图片对象的时候就可以直接用了。
- 抽象享元类就是Objective-C的原生``UIImageView``,它可以显示图片
- 具体享元类可以自己定义一个类继承于``UIImageView``，因为后续我们可以直接添加更多其他的属性。



下面我们看一下用代码如何实现：

### 代码实现

首先我们创建一个工厂，这个工厂可以根据所传入花的类型来返回花内部图片对象，在这里可以直接使用原生的``UIImage``对象，也就是图片对象。而且这个工厂持有一个保存图片对象的池子：

- 当该类型的花第一次被创建时，工厂会新建一个所对应的花内部图片对象，并将这个对象放入池子中保存起来。
- 当该类型的花内部图片对象在池子里已经有了，那么工厂则直接从池子里返回这个花内部图片对象。

下面我们看一下代码是如何实现的：

```objc
//================== FlowerFactory.h ================== 

typedef enum 
{
  kAnemone,
  kCosmos,
  kGerberas,
  kHollyhock,
  kJasmine,
  kZinnia,
  kTotalNumberOfFlowerTypes
    
} FlowerType;

@interface FlowerFactory : NSObject 

- (FlowerImageView *) flowerImageWithType:(FlowerType)type

@end




//================== FlowerFactory.m ================== 
    
@implementation FlowerFactory
{
    NSMutableDictionary *_flowersPool;
}

- (FlowerImageView *) flowerImageWithType:(FlowerType)type
{
    
  if (_flowersPool == nil){
      
     _flowersPool = [[NSMutableDictionary alloc] initWithCapacity:kTotalNumberOfFlowerTypes];
  }
  
  //尝试获取传入类型对应的花内部图片对象
  UIImage *flowerImage = [_flowersPool objectForKey:[NSNumber numberWithInt:type]];
  
  //如果没有对应类型的图片，则生成一个
  if (flowerImage == nil){
    
    NSLog(@"create new flower image with type:%u",type);
      
    switch (type){
            
      case kAnemone:
        flowerImage = [UIImage imageNamed:@"anemone.png"];
        break;
      case kCosmos:
        flowerImage = [UIImage imageNamed:@"cosmos.png"];
        break;
      case kGerberas:
        flowerImage = [UIImage imageNamed:@"gerberas.png"];
        break;
      case kHollyhock:
        flowerImage = [UIImage imageNamed:@"hollyhock.png"];
        break;
      case kJasmine:
        flowerImage = [UIImage imageNamed:@"jasmine.png"];
        break;
      case kZinnia:
        flowerImage = [UIImage imageNamed:@"zinnia.png"];
        break;
      default:
        flowerImage = nil;
        break;
    
    }
      
    [_flowersPool setObject:flowerImage forKey:[NSNumber numberWithInt:type]];
      
  }else{
      //如果有对应类型的图片，则直接使用
      NSLog(@"reuse flower image with type:%u",type);
  }
    
  //创建花对象，将上面拿到的花内部图片对象赋值并返回
  FlowerImageView *flowerImageView = [[FlowerImageView alloc] initWithImage:flowerImage];
    
  return flowerImageView;
}
```

> - 在这个工厂类里面定义了六中图片的类型
> - 该工厂类持有``_flowersPool``私有成员变量，保存新创建过的图片。
> - ``flowerImageWithType:``的实现：结合了``_flowersPool``：当``_flowersPool``没有对应的图片时，新创建图片并返回；否则直接从``_flowersPool``获取对应的图片并返回。

接着我们定义这些花对象``FlowerImageView``：

```objc
//================== FlowerImageView.h ================== 

@interface FlowerImageView : UIImageView 

@end


//================== FlowerImageView.m ================== 
    
@implementation FlowerImageView

@end
```

> 在这里面其实也可以直接使用``UIImageView``，之所以创建一个子类是为了后面可以更好地扩展这些花独有的一些属性。
>
> 注意一下花对象和花内部图片对象的区别：花对象``FlowerImageView``是包含花内部图片对象的``UIImage``。因为在Objective-C里面，``UIImage``是``FlowerImageView``所继承的``UIImageView``的一个属性，所以在这里``FlowerImageView``就直接包含了``UIImage``。



下面我们来看一下客户端如何使用``FlowerFactory``和``FlowerImageView``这两个类：

```objc
//================== client ================== 

//首先建造一个生产花内部图片对象的工厂
FlowerFactory *factory = [[FlowerFactory alloc] init];

for (int i = 0; i < 500; ++i)
{
    //随机传入一个花的类型，让工厂返回该类型对应花类型的花对象
    FlowerType flowerType = arc4random() % kTotalNumberOfFlowerTypes;
    FlowerImageView *flowerImageView = [factory flowerImageWithType:flowerType];

    // 创建花对象的外部属性值（随机的位置和大小）
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat x = (arc4random() % (NSInteger)screenBounds.size.width);
    CGFloat y = (arc4random() % (NSInteger)screenBounds.size.height);
    NSInteger minSize = 10;
    NSInteger maxSize = 50;
    CGFloat size = (arc4random() % (maxSize - minSize + 1)) + minSize;

    //将位置和大小赋予花对象
    flowerImageView.frame = CGRectMake(x, y, size, size);

    //展示这个花对象
    [self.view addSubview:flowerImageView];
}
```

上面代码里面是生成了500朵位置和大小都是随机的花内部图片对象。这500朵花最主要的区别还是它们的位置和大小；而它们使用的花的图片对象只有6个，因此可以用专门的``Factory``来生成和管理这些少数的花内部图片对象，从工厂的打印我们可以看出来：

```
create new flower image with type:1
create new flower image with type:3
create new flower image with type:4
reuse flower image with type:3
create new flower image with type:5
create new flower image with type:2
create new flower image with type:0
reuse flower image with type:5
reuse flower image with type:5
reuse flower image with type:4
reuse flower image with type:1
reuse flower image with type:3
reuse flower image with type:4
reuse flower image with type:0

```

从上面的打印结果可以看出，在六种图片都创建好以后，再获取时就直接拿生成过的图片了，在一定程度上减少了内存的开销。

