//
//  ViewController.m
//  APDemo
//
//  Created by Sun Shijie on 2018/11/4.
//  Copyright © 2018 Sunshijie. All rights reserved.
//

#import "ViewController.h"
#import "Adaptor.h"
#import "OldCache.h"
#import "NewCache.h"

@interface ViewController ()

@property (nonatomic, strong) id<OldCacheProtocol>cache;


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self useOldCache];

    [self useNewCache]
    ;
    [self saveObject:@"cache" forKey:@"key"];
}

- (void)useOldCache{
    
    self.cache = [[OldCache alloc] init];
}

- (void)useNewCache{
    
    self.cache = [[Adaptor alloc] initWithNewCache:[[NewCache alloc] init]];
}


- (void)saveObject:(id)object forKey:(NSString *)key{
    
    [self.cache old_saveCacheObject:object forKey:key];
}

@end
