//
//  Store.h
//  SFPDemo
//
//  Created by Sun Shijie on 2018/10/3.
//  Copyright © 2018年 Sunshijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"
#import "Computer.h"

@interface Store : NSObject

- (void)sellPhone:(Phone *)phone;

- (void)sellComputer:(Computer *)computer;

@end
