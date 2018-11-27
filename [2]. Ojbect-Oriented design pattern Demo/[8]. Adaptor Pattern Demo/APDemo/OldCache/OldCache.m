//
//  OldCache.m
//  APDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "OldCache.h"

@implementation OldCache

- (void)old_saveCacheObject:(id)obj forKey:(NSString *)key{
    
    NSLog(@"saved cache by old cache object");
    
}

- (id)old_getCacheObjectForKey:(NSString *)key{
    
    NSString *obj = @"get cache by old cache object";
    NSLog(@"%@",obj);
    return obj;
}


@end
