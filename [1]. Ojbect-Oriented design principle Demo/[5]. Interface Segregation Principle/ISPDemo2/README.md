```objc
//================== RestaurantPlaceOrderProtocol.h ==================

@protocol RestaurantPlaceOrderProtocol <NSObject>

- (void)placeOrder;

@end
```


支付接口：

```objc
//================== RestaurantPaymentProtocol.h ==================

@protocol RestaurantPaymentProtocol <NSObject>

- (void)payOrder;

@end
```



```objc
//================== Client.h ==================

#import "RestaurantPlaceOrderProtocol.h"
#import "RestaurantPaymentProtocol.h"

@interface Client : NSObject<RestaurantPlaceOrderProtocol,RestaurantPaymentProtocol>
@end
```



```objc
//================== OnlineClient.h ==================

#import "Client.h"
@interface OnlineClient : Client
@end



//================== OnlineClient.m ==================

@implementation OnlineClient

- (void)placeOrder{
    NSLog(@"place on line order");
}

- (void)payOrder{
    NSLog(@"pay on line");
}

@end
```


```objc
//================== TelephoneClient.h ==================
#import "Client.h"
@interface TelephoneClient : Client
@end



//================== TelephoneClient.m ==================
@implementation TelephoneClient

- (void)placeOrder{
    NSLog(@"place telephone order");
}

- (void)payOrder{
    NSLog(@"pay on line");
}

@end
```


```objc
//================== WalkinClient.h ==================

#import "Client.h"
@interface WalkinClient : Client
@end



//================== WalkinClient.m ==================

@implementation WalkinClient

- (void)placeOrder{
    NSLog(@"place walk in customer order");
}

- (void)payOrder{
    NSLog(@"pay in person");
}

@end
```
