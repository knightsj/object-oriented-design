//
//  NewCache.m
//  APDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "NewCache.h"

@implementation NewCache

- (void)new_saveCacheObject:(id)obj forKey:(NSString *)key{
    
    NSLog(@"saved cache by new cache object");
}

- (id)new_getCacheObjectForKey:(NSString *)key{
    
    NSString *obj = @"saved cache by new cache object";
    NSLog(@"%@",obj);
    return obj;
}
@end
