//
//  Payment.h
//  PPDemo
//
//  Created by Sun Shijie on 2018/11/19.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentInterface <NSObject>

- (void)getPayment:(double)money;

@end


