//
//  OldCacheProtocol.h
//  APDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OldCacheProtocol <NSObject>

- (void)old_saveCacheObject:(id)obj forKey:(NSString *)key;

- (id)old_getCacheObjectForKey:(NSString *)key;

@end


