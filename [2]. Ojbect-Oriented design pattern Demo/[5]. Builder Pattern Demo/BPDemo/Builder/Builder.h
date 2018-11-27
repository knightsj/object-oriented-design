//
//  Builder.h
//  BPDemo
//
//  Created by Sun Shijie on 2018/10/5.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

@interface Builder : NSObject
{
    @protected Phone *_phone;
}

- (void)createPhone;

- (void)buildCPU;
- (void)buildCapacity;
- (void)buildDisplay;
- (void)buildCamera;


- (Phone *)obtainPhone;

@end
