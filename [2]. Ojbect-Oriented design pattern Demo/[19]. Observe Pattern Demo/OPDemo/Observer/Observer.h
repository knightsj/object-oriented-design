//
//  Observer.h
//  OPDemo
//
//  Created by Sun Shijie on 2019/3/9.
//  Copyright © 2019 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Subject.h"

@class Subject;

NS_ASSUME_NONNULL_BEGIN

@interface Observer : NSObject
{
    @protected Subject *_subject;
}

- (instancetype)initWithSubject:(Subject *)subject;

- (void)update;

@end

NS_ASSUME_NONNULL_END
