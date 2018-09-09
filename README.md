
![](res/banner.png)

![](https://img.shields.io/badge/language-Objective--C-30A3FC.svg)
[![](https://img.shields.io/badge/License-MIT-ff69b4.svg)](https://github.com/knightsj/object-oriented-design/blob/master/LICENSE)

# Catalogue
- Chapter 1: 面向对象设计原则（Object Oriented Design Principles）
- Chapter 2: 面向对象设计模式（Object Oriented Design Patterns）


# Chapter 1：面向对象设计原则（Object Oriented Design Principles）


缩写 | 英文名称 | 中文名称
---| ----| -----
SRP | Single Responsibility Principle | 单一职责原则
OCP | Open Close Principle | 开闭原则
LSP | Liskov Substitution Principle | 里氏替换原则
LoD | Law of Demeter （ Least Knowledge Principle） | 迪米特法则（最少知道原则）
ISP | Interface Segregation Principle | 接口分离原则
DIP | Dependency Inversion Principle | 依赖倒置原则


## 原则一：开闭原则（Open Close Principle）


### 定义

> Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.

即：一个软件实体如类、模块和函数应该对扩展开放，对修改关闭。

### 定义的解读

- 用抽象构建框架，用实现扩展细节。
- 不以改动原有类的方式来实现新需求，而是应该以实现事先抽象出来的接口（或具体类继承抽象类）的方式来实现。


#### UML 类图对比

未实践开闭原则：
![未实践开闭原则](http://oih3a9o4n.bkt.clouddn.com/OCP11.png)

实践了开闭原则：
![实践了开闭原则](http://oih3a9o4n.bkt.clouddn.com/OCP2.png)


#### Demo

1. 未实践开闭原则：[OCPDemo1](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B2%5D.%20Open%20Close%20Principle/OCPDemo1)
2. 实践了开闭原则：[OCPDemo2](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B2%5D.%20Open%20Close%20Principle/OCPDemo2)



## 原则二：单一职责原则（Single Responsibility Principle）


### 定义

>A class should have a single responsibility, where a responsibility is nothing but a reason to change.

即：一个类只允许有一个职责，即只有一个导致该类变更的原因。


### 定义的解读

- 类职责的变化往往就是导致类变化的原因：也就是说如果一个类具有多种职责，就会有多种导致这个类变化的原因，从而导致这个类的维护变得困难。

- 往往在软件开发中随着需求的不断增加，可能会给原来的类添加一些本来不属于它的一些职责，从而违反了单一职责原则。如果我们发现当前类的职责不仅仅有一个，就应该将本来不属于该类真正的职责分离出去。
- 不仅仅是类，函数（方法）也要遵循单一职责原则，即：一个函数（方法）只做一件事情。如果发现一个函数（方法）里面有不同的任务，则需要将不同的任务以另一个函数（方法）的形式分离出去。




#### UML 类图对比

未实践单一职责原则：
![未实践单一职责原则](http://oih3a9o4n.bkt.clouddn.com/SRP11.png)


实践了单一职责原则：
![实践了单一职责原则](http://oih3a9o4n.bkt.clouddn.com/SRP2.png)

#### Demo


1. 未实践单一职责原则：[SRPDemo1](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B1%5D%20.Single%20Responsibility%20Principle/SRPDemo1)
2. 实践了单一职责原则：[SRPDemo2](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B1%5D%20.Single%20Responsibility%20Principle/SRPDemo2)



## 原则三：依赖倒置原则（Dependency Inversion Principle）

### 定义

>- Depend upon Abstractions. Do not depend upon concretions.
>- Abstractions should not depend upon details. Details should depend upon abstractions
>- High-level modules should not depend on low-level modules. Both should depend on abstractions.

即：

- 依赖抽象，而不是依赖实现。
- 抽象不应该依赖细节；细节应该依赖抽象。
- 高层模块不能依赖低层模块，二者都应该依赖抽象。


### 定义解读


- 针对接口编程，而不是针对实现编程。
- 尽量不要从具体的类派生，而是以继承抽象类或实现接口来实现。
- 关于高层模块与低层模块的划分可以按照决策能力的高低进行划分。业务层自然就处于上层模块，逻辑层和数据层自然就归类为底层。 



#### UML 类图对比

未实践依赖倒置原则：

![未实践依赖倒置原则](http://oih3a9o4n.bkt.clouddn.com/DIP1.png)


实践了依赖倒置原则：
![实践了依赖倒置原则](http://oih3a9o4n.bkt.clouddn.com/DIP22.png)

#### Demo

1. 未实践依赖倒置原则：[DIPDemo1](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B6%5D.%20Dependency%20Inversion%20Principle/DIPDemo1)
2. 实践了依赖倒置原则：[DIPDemo2](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B6%5D.%20Dependency%20Inversion%20Principle/DIPDemo2)



## 原则四：接口分离原则（Interface Segregation Principle）


### 定义


>Many client specific interfaces are better than one general purpose interface.

即：多个特定的客户端接口要好于一个通用性的总接口。


### 定义解读

- 客户端不应该依赖它不需要实现的接口。
- 不建立庞大臃肿的接口，应尽量细化接口，接口中的方法应该尽量少。

需要注意的是：接口的粒度也不能太小。如果过小，则会造成接口数量过多，使设计复杂化。




#### UML 类图对比

未实践接口分离原则：
![未实践接口分离原则](http://oih3a9o4n.bkt.clouddn.com/ISP1.png)


实践了接口分离原则：
![实践了接口分离原则](http://oih3a9o4n.bkt.clouddn.com/ISP2.png)

>通过遵守接口分离原则，接口的设计变得更加简洁，而且各种客户类不需要实现自己不需要实现的接口。

#### Demo

1. 未实践接口分离原则：[ISPDemo1](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B5%5D.%20Interface%20Segregation%20Principle/ISPDemo1)
2. 实践了接口分离原则：[ISPDemo2](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B5%5D.%20Interface%20Segregation%20Principle/ISPDemo2)

## 原则五：迪米特法则（Law of Demeter）


### 定义

>You only ask for objects which you directly need.

即：一个对象应该对尽可能少的对象有接触，也就是只接触那些真正需要接触的对象。

### 定义解读


- 迪米特原则也叫做最少知道原则（Least Know Principle）， 一个类应该只和它的成员变量，方法的输入，返回参数中的类作交流，而不应该引入其他的类（间接交流）。


#### UML 类图对比

未实践迪米特法则：
![未实践迪米特法则](http://oih3a9o4n.bkt.clouddn.com/LOD111.png)



实践了迪米特法则：
![实践了迪米特法则](http://oih3a9o4n.bkt.clouddn.com/LOD2.png)

>很明显，在实践了迪米特法则的 UML 类图里面，没有了``Client``对``GasEngine``的依赖，耦合性降低。

#### Demo

1. 未实践迪米特法则：[LODDemo1](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B4%5D.%20Law%20of%20Demeter/LODDemo1)
2. 实践了迪米特法则：[LODDemo2](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B4%5D.%20Law%20of%20Demeter/LODDemo2)

## 原则六：里氏替换原则（Liskov Substitution Principle）


### 定义

>In a computer program, if S is a subtype of T, then objects of type T may be replaced with objects of type S (i.e. an object of type T may be substituted with any object of a subtype S) without altering any of the desirable properties of the program (correctness, task performed, etc.)


即：所有引用基类的地方必须能透明地使用其子类的对象，也就是说子类对象可以替换其父类对象，而程序执行效果不变。


### 定义的解读

在继承体系中，子类中可以增加自己特有的方法，也可以实现父类的抽象方法，但是不能重写父类的非抽象方法，否则该继承关系就不是一个正确的继承关系。



#### UML 类图对比

未实践里氏替换原则：

![未实践里氏替换原则](http://oih3a9o4n.bkt.clouddn.com/LSP11.png)



实践了里氏替换原则：
![实践了里氏替换原则](http://oih3a9o4n.bkt.clouddn.com/LSP22.png)

#### Demo

1. 未实践里氏替换原则：[LSPDemo1](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B3%5D.%20Liskov%20Substitution%20Principle/LSPDemo1)
2. 实践了里氏替换原则：[LSPDemo2](https://github.com/knightsj/object-oriented-design/tree/master/%5B1%5D.%20Ojbect-Oriented%20design%20principle%20Demo/%5B3%5D.%20Liskov%20Substitution%20Principle/LSPDemo2)

# Chapter 2：面向对象设计模式（Object Oriented Design Patterns）

Coming soon...


# License

This repository is released under [MIT License](https://github.com/knightsj/object-oriented-design/blob/master/LICENSE)


