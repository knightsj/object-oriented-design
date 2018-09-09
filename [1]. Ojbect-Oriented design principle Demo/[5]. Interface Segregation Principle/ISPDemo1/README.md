```objc
//================== RestaurantProtocol.h ==================

@protocol RestaurantProtocol <NSObject>

- (void)placeOnlineOrder;         //下订单：online
- (void)placeTelephoneOrder;      //下订单：通过电话
- (void)placeWalkInCustomerOrder; //下订单：在店里

- (void)payOnline;                //支付订单：online
- (void)payInPerson;              //支付订单：在店里支付

@end
```



```objc
//================== OnlineClient.h ==================

#import "RestaurantProtocol.h"

@interface OnlineClient : NSObject<RestaurantProtocol>
@end



//================== OnlineClient.m ==================

@implementation OnlineClient

- (void)placeOnlineOrder{
    NSLog(@"place on line order");
}

- (void)placeTelephoneOrder{
    //not necessarily
}

- (void)placeWalkInCustomerOrder{
    //not necessarily
}

- (void)payOnline{
    NSLog(@"pay on line");
}

- (void)payInPerson{
    //not necessarily
}
@end

```



```objc
//================== TelephoneClient.h ==================

#import "RestaurantProtocol.h"

@interface TelephoneClient : NSObject<RestaurantProtocol>
@end



//================== TelephoneClient.m ==================

@implementation TelephoneClient

- (void)placeOnlineOrder{
    //not necessarily
}

- (void)placeTelephoneOrder{
    NSLog(@"place telephone order");
}

- (void)placeWalkInCustomerOrder{
    //not necessarily
}

- (void)payOnline{
    NSLog(@"pay on line");
}

- (void)payInPerson{
    //not necessarily
}

@end
```



```objc
//================== WalkinClient.h ==================

#import "RestaurantProtocol.h"

@interface WalkinClient : NSObject<RestaurantProtocol>
@end



//================== WalkinClient.m ==================

@implementation WalkinClient

- (void)placeOnlineOrder{
   //not necessarily
}

- (void)placeTelephoneOrder{
    //not necessarily
}

- (void)placeWalkInCustomerOrder{
    NSLog(@"place walk in customer order");
}

- (void)payOnline{
   //not necessarily
}

- (void)payInPerson{
    NSLog(@"pay in person");
}

@end
```
