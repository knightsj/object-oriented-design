//
//  Subject.m
//  OPDemo
//
//  Created by Sun Shijie on 2019/3/1.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Subject.h"


@implementation Subject

- (instancetype)init{
    
    self = [super init];
    if (self) {
        _observers = [NSMutableArray array];
    }
    return self;
}



- (void)addObserver:( Observer * ) observer{
    
    [_observers addObject:observer];
}


- (void)removeObserver:( Observer *) observer{
    
    [_observers removeObject:observer];
}


- (void)notifyObservers{
    
    [_observers enumerateObjectsUsingBlock:^(Observer *  _Nonnull observer, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [observer update];
    }];
}

- (void)setBuyingPrice:(float)price{
    
    _buyingPrice = price;
    
    [self notifyObservers];
}

- (double)getBuyingPrice{
    
    return _buyingPrice;
}


@end
