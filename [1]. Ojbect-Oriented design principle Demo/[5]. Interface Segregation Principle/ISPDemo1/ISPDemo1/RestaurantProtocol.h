//
//  RestaurantProtocol.h
//  ISPDemo1
//
//  Created by J_Knight_ on 2018/8/26.
//  Copyright © 2018年 J_Knight_. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RestaurantProtocol <NSObject>

- (void)placeOnlineOrder;         //下订单：online
- (void)placeTelephoneOrder;      //下订单：通过电话
- (void)placeWalkInCustomerOrder; //下订单：在店里
- (void)payOnline;                //支付订单：online
- (void)payInPerson;              //支付订单：在店里支付

@end
