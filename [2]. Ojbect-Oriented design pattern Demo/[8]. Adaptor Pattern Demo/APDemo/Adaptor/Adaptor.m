//
//  Adaptor.m
//  APDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "Adaptor.h"
#import "NewCache.h"

@implementation Adaptor
{
    NewCache *_newCache;
}

- (instancetype)initWithNewCache:(NewCache *)newCache{
    
    self = [super init];
    if (self) {
        _newCache = newCache;
    }
    return self;
}

- (void)old_saveCacheObject:(id)obj forKey:(NSString *)key{
    
    //transfer responsibility to new cache object
    [_newCache new_saveCacheObject:obj forKey:key];
}

- (id)old_getCacheObjectForKey:(NSString *)key{
    
    //transfer responsibility to new cache object
    return [_newCache new_getCacheObjectForKey:key];
    
}
@end
