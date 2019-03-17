//
//  DispenseProtocol.h
//  CRPDemo
//
//  Created by Sun Shijie on 2019/3/3.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DispenseProtocol <NSObject>

- (void)dispense:(int)amount;

@end

NS_ASSUME_NONNULL_END
