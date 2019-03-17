//
//  Currency.h
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/2.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Currency : NSObject

- (instancetype)initWithAmount:(int)amount;

- (int)getAmount;

@end

NS_ASSUME_NONNULL_END
