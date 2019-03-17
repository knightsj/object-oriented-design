//
//  Subject.h
//  OPDemo
//
//  Created by Sun Shijie on 2019/3/1.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Observer.h"

@class Observer;

@interface Subject : NSObject
{
    @protected float _buyingPrice;
    @protected NSMutableArray <Observer *>*_observers;
}

- (void)addObserver:(Observer *) observer;


- (void)removeObserver:(Observer *) observer;


- (void)notifyObservers;


- (void)setBuyingPrice:(float)price;


- (double)getBuyingPrice;


@end


