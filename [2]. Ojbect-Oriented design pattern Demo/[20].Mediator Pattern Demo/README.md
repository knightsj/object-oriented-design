# 中介者模式代码示例

首先我们创建通话的用户类``User``:

```objc
//================== User.h ==================

@interface User : NSObject

- (instancetype)initWithName:(NSString *)name mediator:(ChatMediator *)mediator;

- (void)sendMessage:(NSString *)message;

- (void)receivedMessage:(NSString *)message;

@end



//================== User.m ==================

@implementation User
{
    NSString *_name;
    ChatMediator *_chatMediator;
}

- (instancetype)initWithName:(NSString *)name mediator:(ChatMediator *)mediator{
    
    self = [super init];
    if (self) {
        _name = name;
        _chatMediator = mediator;
    }
    return self;
}

- (void)sendMessage:(NSString *)message{
    
    NSLog(@"================");
    NSLog(@"%@ sent message:%@",_name,message);
    [_chatMediator sendMessage:message fromUser:self];
    
}

- (void)receivedMessage:(NSString *)message{
    
    NSLog(@"%@ has received message:%@",_name,message);
}

@end
```

用户类在初始化的时候需要传入中介者的实例，并持有。目的是为了在后面发送消息的时候把消息转发给中介者。

另外，用户类还对外提供了发送消息和接收消息的接口。而在发送消息的方法内部其实调用的是中介者的发送消息的方法（因为中介者持有了所有用户的实例，因此可以做多路转发），具体是如何做的我们可以看下中介者类``ChatMediator``的实现：


```objc
//================== ChatMediator.h ==================

@interface ChatMediator : NSObject

- (void)addUser:(User *)user;

- (void)sendMessage:(NSString *)message fromUser:(User *)user;

@end



//================== ChatMediator.m ==================

@implementation ChatMediator
{
    NSMutableArray <User *>*_userList;
}

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        _userList = [NSMutableArray array];
    }
    return self;
}

- (void)addUser:(User *)user{

    [_userList addObject:user];
}

- (void)sendMessage:(NSString *)message fromUser:(User *)user{
    
    [_userList enumerateObjectsUsingBlock:^(User * _Nonnull iterUser, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (iterUser != user) {
            [iterUser receivedMessage:message];
        }
    }];
}

@end
```

中介者类提供了``addUser:``的方法，因此我们可以不断将用户添加到这个中介者里面（可以看做是注册行为或是“加入群聊”）。在每次加入一个``User``实例后，都将这个实例添加到中介者持有的这个可变数组里。于是在将来中介者就可以通过遍历数组的方式来做消息的多路转发，具体实现可以看``sendMessage:fromUser:``这个方法。

到现在为止，用户类和中介者类都创建好了，我们看一下消息是如何转发的：



```objc
ChatMediator *cm = [[ChatMediator alloc] init];
    
User *user1 = [[User alloc] initWithName:@"Jack" mediator:cm];
User *user2 = [[User alloc] initWithName:@"Bruce" mediator:cm];
User *user3 = [[User alloc] initWithName:@"Lucy" mediator:cm];
    
[cm addUser:user1];
[cm addUser:user2];
[cm addUser:user3];
    
[user1 sendMessage:@"happy"];
[user2 sendMessage:@"new"];
[user3 sendMessage:@"year"];
```

从代码中可以看到，我们这里创建了三个用户，分别加入到了聊天中介者对象里。再后面我们分别让每个用户发送了一条消息。我们下面通过日至输出来看一下每个用户的消息接收情况：

```
[13806:1284059] ================
[13806:1284059] Jack sent message:happy
[13806:1284059] Bruce has received message:happy
[13806:1284059] Lucy has received message:happy
[13806:1284059] ================
[13806:1284059] Bruce sent message:new
[13806:1284059] Jack has received message:new
[13806:1284059] Lucy has received message:new
[13806:1284059] ================
[13806:1284059] Lucy sent message:year
[13806:1284059] Jack has received message:year
[13806:1284059] Bruce has received message:year
```
