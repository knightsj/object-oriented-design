//
//  Adaptor.h
//  APDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OldCacheProtocol.h"

@class NewCache;

@interface Adaptor : NSObject <OldCacheProtocol>

- (instancetype)initWithNewCache:(NewCache *)newCache;

@end

