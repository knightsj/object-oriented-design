//
//  Observer.m
//  OPDemo
//
//  Created by Sun Shijie on 2019/3/9.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import "Observer.h"

@implementation Observer

- (instancetype)initWithSubject:(Subject *)subject{
    
    self = [super init];
    if (self) {
        _subject = subject;
       [_subject addObserver:self];
    }
    return self;
}

- (void)update{
    
    NSLog(@"implementation by subclasses");
}

@end
