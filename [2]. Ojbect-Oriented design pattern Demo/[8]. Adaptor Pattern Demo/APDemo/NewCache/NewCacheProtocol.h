//
//  NewCacheProtocol.h
//  APDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NewCacheProtocol <NSObject>

- (void)new_saveCacheObject:(id)obj forKey:(NSString *)key;

- (id)new_getCacheObjectForKey:(NSString *)key;

@end


